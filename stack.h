#ifndef STACK_H
#define STACK_H

#include <deque>
#include <map>
#include <string>
#include <iostream>

template <typename T>
class Stack
{
private:
    typedef std::map<std::string, T> MapType;
    typedef typename MapType::const_iterator MapIter;
    typedef std::deque<MapType> StackType;
    typedef typename StackType::const_reverse_iterator StackRIter;
public:
    Stack() { NewLevel(); }
    void NewLevel() 
    { 
	stack.push_back(MapType()); 
    }

    size_t MaxLevel() const
    {
	return stack.size()-1;
    }

    std::vector<T> GetLevel()
    {
	std::vector<T> v;
	for(auto i : stack.back())
	{
	    v.push_back(i.second);
	}
	return v;
    }

    std::vector<T> GetLevel(int n)
    {
	std::vector<T> v;
	for(auto i : stack[n])
	{
	    v.push_back(i.second);
	}
	return v;
    }

    void DropLevel() 
    { 
	stack.pop_back(); 
    }

    /* Returns false on failure */
    bool Add(const std::string& name, T v) 
    {
	MapIter it = stack.back().find(name);
	if (it == stack.back().end())
	{
	    stack.back()[name] = v;
	    return true;
	}
	return false;
    }

    T Find(const std::string& name, size_t& level) const
    {
	int lvl = MaxLevel();
	for(StackRIter s = stack.rbegin(); s != stack.rend(); s++, lvl--)
	{
	    MapIter it = s->find(name);
	    if (it != s->end())
	    {
		level = lvl;
		return it->second;
	    }
	}
	return 0;
    }

    T Find(const std::string& name) 
    {
	size_t dummy;
	return Find(name, dummy);
    }

    T FindTopLevel(const std::string& name)
    {
	MapIter it = stack.back().find(name);
	if (it != stack.back().end())
	{
	    return it->second;
	}
	return 0;
    }

    T FindBottomLevel(const std::string& name)
    {
	MapIter it = stack.front().find(name);
	if (it != stack.front().end())
	{
	    return it->second;
	}
	return 0;
    }

    void dump() const
    {
	int n = 0;
	for(auto s : stack)
	{
	    std::cerr << "Level " << n << std::endl;
	    n++;
	    for(auto v : s)
	    {
		std::cerr << v.first << ": ";
		v.second->dump();
		std::cerr << std::endl;
	    }
	}
    }

private:
	StackType stack;
};

template <typename T>
class StackWrapper
{
public:
    StackWrapper(Stack<T> &v) : stack(v)
    {
	stack.NewLevel();
    }
    ~StackWrapper()
    {
	stack.DropLevel();
    }
private:
    Stack<T>& stack;
};

#endif
