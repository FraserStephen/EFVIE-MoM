#ifndef EM_RULE_INCLUDED
#define EM_RULE_INCLUDED

#include <_BitDepthDefines.hpp>

#include <fstream>
#include <string>
#include <vector>
#include <map>
#include <memory>

#include <arrayfire.h>

using namespace std;

template< class T >
class EmRule
{
protected:
	virtual bool SetRuleData_( const vector< T >& ruleData ) = 0;
	virtual bool GenerateProps_(
		const UINT_T& tetraCount,
		const shared_ptr< T >& vertexData,
		const shared_ptr< UINT_T >& tetraVertexIndex,
		shared_ptr< T >& emPropData
	) const = 0;
	virtual shared_ptr< EmRule< T > > Clone_() const = 0;

public:

	bool SetRuleData( const vector< T >& ruleData )
	{
		return SetRuleData_( ruleData );
	}

	bool GenerateProps(
		const UINT_T& tetraCount,
		const shared_ptr< T >& vertexData,
		const shared_ptr< UINT_T >& tetraVertexIndex,
		shared_ptr< T >& emPropData // must be preallocated
	) const
	{
		return GenerateProps_( tetraCount, vertexData, tetraVertexIndex, emPropData );
	}

	shared_ptr< EmRule< T > > Clone() const
	{
		return Clone_();
	}

};



#endif