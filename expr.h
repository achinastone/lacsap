#ifndef EXPR_H
#define EXPR_H

#include "token.h"
#include "types.h"
#include "namedobject.h"
#include "astvisitor.h"
#include "stack.h"
#include "builtin.h"
#include <llvm/IR/Value.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/Casting.h>
#include <string>
#include <vector>

class ExprAST : public Visitable
{
    friend class TypeCheckVisitor;
public:
    enum ExprKind
    {
	EK_Expr,		/* 0 */
	EK_RealExpr,		/* 1 */
	EK_IntegerExpr,
	EK_CharExpr,
	EK_NilExpr,

	// Addressable types
	EK_AddressableExpr,	/* 5 */
	EK_StringExpr,
	EK_VariableExpr,
	EK_ArrayExpr,
	EK_PointerExpr,
	EK_FilePointerExpr,	/* 10 */
	EK_FieldExpr,
	EK_VariantFieldExpr,
	EK_FunctionExpr,
	EK_SetExpr,
	EK_TypeCastExpr,	/* 15 */
	EK_LastAddressable,

	EK_BinaryExpr,
	EK_UnaryExpr,
	EK_RangeExpr,
	EK_Block,		/* 20 */
	EK_AssignExpr,
	EK_VarDecl,
	EK_Function,
	EK_Prototype,
	EK_CallExpr,		/* 25 */
	EK_BuiltinExpr,
	EK_IfExpr,
	EK_ForExpr,
	EK_WhileExpr,
	EK_RepeatExpr,		/* 30 */
	EK_Write,
	EK_Read,
	EK_LabelExpr,
	EK_CaseExpr,
	EK_WithExpr,		/* 35 */
	EK_RangeReduceExpr,
	EK_RangeCheckExpr,
	EK_SizeOfExpr,
	EK_VTableExpr, 		/* 40 */
	EK_VirtFunction,
	EK_Goto,
	EK_Unit,
    };
    ExprAST(const Location &w, ExprKind k)
	: loc(w), kind(k), type(0) { }
    ExprAST(const Location &w, ExprKind k, Types::TypeDecl* ty)
	: loc(w), kind(k), type(ty) {}
    virtual ~ExprAST() {}
    void dump(std::ostream& out) const;
    void dump() const;
    virtual void DoDump(std::ostream& out) const
    {
	out << "Empty node";
    }
    virtual void accept(Visitor& v) { v.visit(this); }
    std::string ToString();
    virtual llvm::Value* CodeGen() = 0;
    ExprKind getKind() const { return kind; }
    void SetType(Types::TypeDecl* ty) { type = ty; }
    virtual Types::TypeDecl* Type() const { return type; }
    void EnsureSized() const;
    const Location& Loc() const { return loc; }
private:
    const Location loc;
    const ExprKind kind;
protected:
    Types::TypeDecl* type;
};

class RealExprAST : public ExprAST
{
public:
    RealExprAST(const Location& w, double v, Types::TypeDecl* ty)
	: ExprAST(w, EK_RealExpr, ty), val(v) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_RealExpr; }
private:
    double val;
};

class IntegerExprAST : public ExprAST
{
public:
    IntegerExprAST(const Location& w, uint64_t v, Types::TypeDecl* ty)
	: ExprAST(w, EK_IntegerExpr, ty), val(v) {}
    IntegerExprAST(const Location& w, ExprKind ek, uint64_t v, Types::TypeDecl* ty)
	: ExprAST(w, ek, ty), val(v) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    uint64_t Int() { return val; }
    static bool classof(const ExprAST* e)
    {
	return e->getKind() == EK_IntegerExpr || e->getKind() == EK_CharExpr;
    }
protected:
    uint64_t val;
};

class CharExprAST : public IntegerExprAST
{
public:
    CharExprAST(const Location& w, char v, Types::TypeDecl* ty)
	: IntegerExprAST(w, EK_CharExpr, v, ty) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_CharExpr; }
};

class NilExprAST : public ExprAST
{
public:
    NilExprAST(const Location& w)
	: ExprAST(w, EK_NilExpr, new Types::PointerDecl(new Types::VoidDecl)) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_NilExpr; }
};

class AddressableAST : public ExprAST
{
public:
    AddressableAST(const Location& w, ExprKind k, Types::TypeDecl* ty) :
	ExprAST(w, k, ty) {}
    virtual llvm::Value* Address() = 0;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e)
    {
	return e->getKind() >= EK_AddressableExpr && e->getKind() <= EK_LastAddressable;
    }
};

class StringExprAST : public AddressableAST
{
public:
    StringExprAST(const Location& w, const std::string &v, Types::TypeDecl* ty)
	: AddressableAST(w, EK_StringExpr, ty), val(v) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    llvm::Value* Address() override;
    const std::string& Str() const { return val; }
    static bool classof(const ExprAST* e) { return e->getKind() == EK_StringExpr; }
private:
    std::string val;
};

class VariableExprAST : public AddressableAST
{
public:
    VariableExprAST(const Location& w, const std::string& nm, Types::TypeDecl* ty)
	: AddressableAST(w, EK_VariableExpr, ty), name(nm) {}
    VariableExprAST(const Location& w, ExprKind k, const std::string& nm, Types::TypeDecl* ty)
	: AddressableAST(w, k, ty), name(nm) {}
    VariableExprAST(const Location& w, ExprKind k, const VariableExprAST* v, Types::TypeDecl* ty)
	: AddressableAST(w, k, ty), name(v->name) {}
    void DoDump(std::ostream& out) const override;
    const std::string& Name() const { return name; }
    llvm::Value* Address() override;
    static bool classof(const ExprAST* e)
    {
	return e->getKind() >= EK_VariableExpr && e->getKind() <= EK_LastAddressable;
    }
protected:
    std::string name;
};

class ArrayExprAST : public VariableExprAST
{
    friend class TypeCheckVisitor;
public:
    ArrayExprAST(const Location& w,
		 VariableExprAST* v,
		 const std::vector<ExprAST*>& inds,
		 const std::vector<Types::RangeDecl*>& r,
		 Types::TypeDecl* ty);
    void DoDump(std::ostream& out) const override;
    /* Don't need CodeGen, just calculate address and use parent CodeGen */
    llvm::Value* Address() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_ArrayExpr; }
    void accept(Visitor& v) override;
private:
    VariableExprAST* expr;
    std::vector<ExprAST*> indices;
    std::vector<Types::RangeDecl*> ranges;
    std::vector<size_t> indexmul;
};

class PointerExprAST : public VariableExprAST
{
public:
    PointerExprAST(const Location& w, VariableExprAST* p, Types::TypeDecl* ty)
	: VariableExprAST(w, EK_PointerExpr, p, ty), pointer(p) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* Address() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_PointerExpr; }
    void accept(Visitor& v) override;
private:
    ExprAST* pointer;
};

class FilePointerExprAST : public VariableExprAST
{
public:
    FilePointerExprAST(const Location& w, VariableExprAST* p, Types::TypeDecl* ty)
	: VariableExprAST(w, EK_FilePointerExpr, p, ty), pointer(p) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* Address() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_FilePointerExpr; }
    void accept(Visitor& v) override;
private:
    ExprAST* pointer;
};

class FieldExprAST : public VariableExprAST
{
public:
    FieldExprAST(const Location& w, VariableExprAST* base, int elem, Types::TypeDecl* ty)
	: VariableExprAST(w, EK_FieldExpr, base, ty), expr(base), element(elem) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* Address() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_FieldExpr; }
    void accept(Visitor& v) override;
private:
    VariableExprAST* expr;
    int element;
};

class VariantFieldExprAST : public VariableExprAST
{
public:
    VariantFieldExprAST(const Location& w, VariableExprAST* base, int elem, Types::TypeDecl* ty)
	: VariableExprAST(w, EK_VariantFieldExpr, base, ty), expr(base), element(elem) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* Address() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_VariantFieldExpr; }
private:
    VariableExprAST* expr;
    int element;
};

class FunctionExprAST : public VariableExprAST
{
public:
    FunctionExprAST(const Location& w, const std::string& nm, Types::TypeDecl* ty)
	: VariableExprAST(w, EK_FunctionExpr, nm, ty) { }

    void DoDump(std::ostream& out) const override;
    llvm::Value* Address() override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_FunctionExpr; }
};

class SetExprAST : public AddressableAST
{
    friend class TypeCheckVisitor;
public:
    SetExprAST(const Location& w, std::vector<ExprAST*> v, Types::TypeDecl* ty)
	: AddressableAST(w, EK_SetExpr, ty), values(v) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    llvm::Value* Address() override;
    llvm::Value* MakeConstantSet(Types::TypeDecl* type);
    static bool classof(const ExprAST* e) { return e->getKind() == EK_SetExpr; }
private:
    std::vector<ExprAST*> values;
};

class BinaryExprAST : public ExprAST
{
    friend class TypeCheckVisitor;
public:
    BinaryExprAST(Token op, ExprAST* l, ExprAST* r)
	: ExprAST(op.Loc(), EK_BinaryExpr), oper(op), lhs(l), rhs(r) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    llvm::Value* SetCodeGen();
    static bool classof(const ExprAST* e) { return e->getKind() == EK_BinaryExpr; }
    llvm::Value* InlineSetFunc(const std::string& name, bool resTyIsSet);
    llvm::Value* CallSetFunc(const std::string& name, bool resTyIsSet);
    llvm::Value* CallStrFunc(const std::string& name);
    llvm::Value* CallArrFunc(const std::string& name, size_t size);
    Types::TypeDecl* Type() const override;
    void UpdateType(Types::TypeDecl* ty);
    void accept(Visitor& v) override { rhs->accept(v); lhs->accept(v); v.visit(this); }
private:
    Token            oper;
    ExprAST*         lhs;
    ExprAST*         rhs;
};

class UnaryExprAST : public ExprAST
{
    friend class TypeCheckVisitor;
public:
    UnaryExprAST(const Location& w, Token op, ExprAST* r)
	: ExprAST(w, EK_UnaryExpr), oper(op), rhs(r) {};
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    Types::TypeDecl* Type() const override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_UnaryExpr; }
    void accept(Visitor& v) override { rhs->accept(v); v.visit(this); }
private:
    Token oper;
    ExprAST* rhs;
};

class RangeExprAST : public ExprAST
{
    friend class TypeCheckVisitor;
public:
    RangeExprAST(const Location& w, ExprAST* l, ExprAST* h)
	: ExprAST(w, EK_RangeExpr), low(l), high(h) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    llvm::Value* Low() { return low->CodeGen(); }
    llvm::Value* High() { return high->CodeGen(); }
    ExprAST* LowExpr() { return low; }
    ExprAST* HighExpr() { return high; }
    Types::TypeDecl* Type() const override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_RangeExpr; }
    void accept(Visitor& v) override { low->accept(v); high->accept(v); v.visit(this); }
private:
    ExprAST* low;
    ExprAST* high;
};

class BlockAST : public ExprAST
{
public:
    BlockAST(const Location& w, std::vector<ExprAST*> block)
	: ExprAST(w, EK_Block), content(block) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    bool IsEmpty() { return content.size() == 0; }
    static bool classof(const ExprAST* e) { return e->getKind() == EK_Block; }
    std::vector<ExprAST*>& Content() { return content; }
    void accept(Visitor& v) override;
private:
    std::vector<ExprAST*> content;
};

class AssignExprAST : public ExprAST
{
    friend class TypeCheckVisitor;
public:
    AssignExprAST(const Location& w, ExprAST* l, ExprAST* r)
	: ExprAST(w, EK_AssignExpr), lhs(l), rhs(r) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_AssignExpr; }
    void accept(Visitor& v) override { rhs->accept(v); lhs->accept(v); v.visit(this); }
private:
    llvm::Value* AssignStr();
    ExprAST* lhs;
    ExprAST* rhs;
};

class VarDeclAST : public ExprAST
{
public:
    VarDeclAST(const Location& w, std::vector<VarDef> v)
	: ExprAST(w, EK_VarDecl), vars(v), func(0) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    void SetFunction(llvm::Function* f) { func = f; }
    static bool classof(const ExprAST* e) { return e->getKind() == EK_VarDecl; }
private:
    std::vector<VarDef> vars;
    llvm::Function* func;
};

class FunctionAST;

class PrototypeAST : public ExprAST
{
    friend class TypeCheckVisitor;
public:
    PrototypeAST(const Location& w,
		 const std::string& nm,
		 const std::vector<VarDef>& ar,
		 Types::TypeDecl* resTy,
		 Types::ClassDecl* obj)
	: ExprAST(w, EK_Prototype, resTy), name(nm), args(ar), function(0), baseobj(obj),
	  isForward(false), hasSelf(false)
    {
	assert(resTy && "Type must not be null!");
    }
    void DoDump(std::ostream& out) const override;
    llvm::Function* CodeGen() override;
    llvm::Function* CodeGen(const std::string& namePrefix);
    void CreateArgumentAlloca(llvm::Function* fn);
    std::string Name() const { return name; }
    const std::vector<VarDef>& Args() const { return args; }
    bool IsForward() const { return isForward; }
    bool HasSelf() const { return hasSelf; }
    void SetIsForward(bool v) { isForward = v; }
    void SetHasSelf(bool v) { hasSelf = v; }
    void SetFunction(FunctionAST* fun) { function = fun; }
    FunctionAST* Function() const { return function; }
    void AddExtraArgsLast(const std::vector<VarDef>& extra);
    void AddExtraArgsFirst(const std::vector<VarDef>& extra);
    Types::ClassDecl* BaseObj() const { return baseobj; }
    static bool classof(const ExprAST* e) { return e->getKind() == EK_Prototype; }
private:
    std::string         name;
    std::vector<VarDef> args;
    FunctionAST*        function;
    Types::ClassDecl*   baseobj;
    bool                isForward;
    bool                hasSelf;
};

class FunctionAST : public ExprAST
{
public:
    FunctionAST(const Location& w, PrototypeAST *prot, const std::vector<VarDeclAST*>& v, BlockAST* b);
    void DoDump(std::ostream& out) const override;
    llvm::Function* CodeGen() override;
    llvm::Function* CodeGen(const std::string& namePrefix);
    const PrototypeAST* Proto() const { return proto; }
    void AddSubFunctions(const std::vector<FunctionAST *>& subs) { subFunctions = subs; }
    void SetParent(FunctionAST* p) { parent = p; }
    void SetUsedVars(const std::vector<NamedObject*>& varsUsed,
		     const Stack<NamedObject*>& nameStack);
    const std::vector<VarDef>& UsedVars() { return usedVariables; }
    static bool classof(const ExprAST* e) { return e->getKind() == EK_Function; }
    void accept(Visitor& v) override;
private:
    PrototypeAST*              proto;
    std::vector<VarDeclAST*>   varDecls;
    BlockAST*                  body;
    std::vector<FunctionAST*>  subFunctions;
    std::vector<VarDef>        usedVariables;
    FunctionAST*               parent;
};

class CallExprAST : public ExprAST
{
    friend class TypeCheckVisitor;
public:
    CallExprAST(const Location& w, ExprAST* c, std::vector<ExprAST*> a, const PrototypeAST* p)
	: ExprAST(w, EK_CallExpr, p->Type()), proto(p), callee(c), args(a)
    {
	assert(proto && "Should have prototype!");
    }
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_CallExpr; }
    const PrototypeAST* Proto() { return proto; }
    std::vector<ExprAST*>& Args() { return args; }
    void accept(Visitor& v) override;
private:
    const PrototypeAST*   proto;
    ExprAST*              callee;
    std::vector<ExprAST*> args;
};

// Builtin funciton call
class BuiltinExprAST : public ExprAST
{
    friend class TypeCheckVisitor;
public:
    BuiltinExprAST(const Location& w, Builtin::BuiltinFunctionBase* b)
	: ExprAST(w, EK_BuiltinExpr, b->Type()), bif(b)
    {
    }
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_BuiltinExpr; }
    void accept(Visitor& v) override;
private:
    Builtin::BuiltinFunctionBase* bif;
};

class IfExprAST : public ExprAST
{
public:
    IfExprAST(const Location& w, ExprAST* c, ExprAST* t, ExprAST* e)
	: ExprAST(w, EK_IfExpr), cond(c), then(t), other(e) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_IfExpr; }
    void accept(Visitor& v) override;
private:
    ExprAST* cond;
    ExprAST* then;
    ExprAST* other;
};

class ForExprAST : public ExprAST
{
public:
    ForExprAST(const Location& w, const std::string& var, ExprAST* s, ExprAST* e, bool down, ExprAST* b)
	: ExprAST(w, EK_ForExpr), varName(var), start(s), stepDown(down), end(e), body(b) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_ForExpr; }
    void accept(Visitor& v) override;
private:
    std::string varName;
    ExprAST* start;
    bool     stepDown;   // true for "downto"
    ExprAST* end;
    ExprAST* body;
};

class WhileExprAST : public ExprAST
{
public:
    WhileExprAST(const Location& w, ExprAST* c, ExprAST* b)
	: ExprAST(w, EK_WhileExpr), cond(c), body(b) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_WhileExpr; }
    void accept(Visitor& v) override;
private:
    ExprAST* cond;
    ExprAST* body;
};

class RepeatExprAST : public ExprAST
{
public:
    RepeatExprAST(const Location& w, ExprAST* c, ExprAST* b)
	: ExprAST(w, EK_RepeatExpr), cond(c), body(b) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_RepeatExpr; }
    void accept(Visitor& v) override;
private:
    ExprAST* cond;
    ExprAST* body;
};

class WriteAST : public ExprAST
{
public:
    struct WriteArg
    {
	WriteArg()
	    : expr(0), width(0), precision(0)  {}
	ExprAST* expr;
	ExprAST* width;
	ExprAST* precision;
    };

    WriteAST(const Location& w, VariableExprAST* f, const std::vector<WriteArg> &a, bool isLn)
	: ExprAST(w, EK_Write), file(f), args(a), isWriteln(isLn) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_Write; }
    void accept(Visitor& v) override;
private:
    VariableExprAST*      file;
    std::vector<WriteArg> args;
    bool                  isWriteln;
};

class ReadAST : public ExprAST
{
public:
    ReadAST(const Location& w, VariableExprAST* fi, const std::vector<ExprAST*> &a, bool isLn)
	: ExprAST(w, EK_Read), file(fi), args(a), isReadln(isLn) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_Read; }
    void accept(Visitor& v) override;
private:
    VariableExprAST*      file;
    std::vector<ExprAST*> args;
    bool                  isReadln;
};

class LabelExprAST : public ExprAST
{
public:
    LabelExprAST(const Location& w, const std::vector<int>& lab, ExprAST* st)
	: ExprAST(w, EK_LabelExpr), labelValues(lab),stmt(st) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    llvm::Value* CodeGen(llvm::SwitchInst* inst, llvm::BasicBlock* afterBB, llvm::Type* ty);
    static bool classof(const ExprAST* e) { return e->getKind() == EK_LabelExpr; }
    void accept(Visitor& v) override;
private:
    std::vector<int> labelValues;
    ExprAST*         stmt;
};

class CaseExprAST : public ExprAST
{
public:
    CaseExprAST(const Location& w, ExprAST* e, const std::vector<LabelExprAST*>& lab, ExprAST* other)
	: ExprAST(w, EK_CaseExpr), expr(e), labels(lab), otherwise(other) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_CaseExpr; }
    void accept(Visitor& v) override;
private:
    ExprAST* expr;
    std::vector<LabelExprAST*> labels;
    ExprAST* otherwise;
};

class WithExprAST : public ExprAST
{
public:
    WithExprAST(const Location& w, ExprAST* b)
	: ExprAST(w, EK_WithExpr), body(b) {};
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_WithExpr; }
    void accept(Visitor& v) override { body->accept(v); v.visit(this); }
private:
    ExprAST* body;
};

class RangeReduceAST : public ExprAST
{
public:
    RangeReduceAST(ExprAST* e, Types::RangeDecl* r)
	: ExprAST(e->Loc(), EK_RangeReduceExpr, e->Type()), expr(e), range(r)
    { }
    RangeReduceAST(ExprKind k, ExprAST* e, Types::RangeDecl* r)
	: ExprAST(e->Loc(), k, e->Type()), expr(e), range(r)
    { }
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e)
    {
	return (e->getKind() == EK_RangeReduceExpr) || (e->getKind() == EK_RangeCheckExpr);
    }
protected:
    ExprAST* expr;
    Types::RangeDecl* range;
};

class RangeCheckAST : public RangeReduceAST
{
public:
    RangeCheckAST(ExprAST* e, Types::RangeDecl* r)
	: RangeReduceAST(EK_RangeCheckExpr, e, r)
    { }
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_RangeCheckExpr; }
};

class TypeCastAST : public AddressableAST
{
public:
    TypeCastAST(const Location& w, ExprAST* e, const Types::TypeDecl* t)
	: AddressableAST(w, EK_TypeCastExpr, const_cast<Types::TypeDecl*>(t)), expr(e) {};
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    llvm::Value* Address() override;
    ExprAST* Expr() { return expr; }
    static bool classof(const ExprAST* e) { return e->getKind() == EK_TypeCastExpr; }
private:
    ExprAST* expr;
};

class SizeOfExprAST : public ExprAST
{
public:
    SizeOfExprAST(const Location& w, Types::TypeDecl* t)
	: ExprAST(w, EK_SizeOfExpr, t) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    Types::TypeDecl* Type() const override { return new Types::IntegerDecl; }
    static bool classof(const ExprAST* e) { return e->getKind() == EK_SizeOfExpr; }
};

class VTableAST : public ExprAST
{
public:
    VTableAST(const Location& w, Types::ClassDecl* cd)
	: ExprAST(w, EK_VTableExpr, cd), classDecl(cd), vtable(0) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    std::vector<llvm::Constant*> GetInitializer();
    void Fixup();
    static bool classof(const ExprAST* e) { return e->getKind() == EK_VTableExpr; }
private:
    Types::ClassDecl* classDecl;
    llvm::GlobalVariable* vtable;
};

class VirtFunctionAST : public AddressableAST
{
public:
    VirtFunctionAST(const Location& w, VariableExprAST* slf, int idx, Types::TypeDecl* ty);
    void DoDump(std::ostream& out) const override;
    llvm::Value* Address() override;
    int Index() const { return index; }
    VariableExprAST* Self() { return self; }
    static bool classof(const ExprAST* e) { return e->getKind() == EK_VirtFunction; }
private:
    int index;
    VariableExprAST* self;
};

class GotoAST : public ExprAST
{
public:
    GotoAST(const Location& w, int d)
	: ExprAST(w, EK_Goto), dest(d) {}
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_Goto; }
private:
    int dest;
};

class UnitAST : public ExprAST
{
public:
    UnitAST(const Location& w, const std::vector<ExprAST*>& c, FunctionAST* init)
	: ExprAST(w, EK_Unit), initFunc(init), code(c) { };
    void DoDump(std::ostream& out) const override;
    llvm::Value* CodeGen() override;
    static bool classof(const ExprAST* e) { return e->getKind() == EK_Unit; }
    void accept(Visitor& v) override;
private:
    FunctionAST* initFunc;
    std::vector<ExprAST*> code;
};

/* Useful global functions */
llvm::Value* MakeIntegerConstant(int val);
llvm::Value* MakeConstant(uint64_t val, llvm::Type* ty);
llvm::Value* ErrorV(const std::string& msg);
bool FileInfo(llvm::Value* f, int& recSize, bool& isText);
bool FileIsText(llvm::Value* f);
llvm::Value* MakeAddressable(ExprAST* e);
void BackPatch();
llvm::Constant* GetFunction(llvm::Type* resTy, const std::vector<llvm::Type*>& args,
			    const std::string&name);
llvm::Constant* GetFunction(Types::TypeDecl::TypeKind res, const std::vector<llvm::Type*>& args,
			    const std::string& name);
std::string ShortName(const std::string& name);

#endif
