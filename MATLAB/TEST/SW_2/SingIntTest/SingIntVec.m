function result = SingIntVec( r_, v1_, v2_, v3_, v4_ )
	
	result = SingIntVec_Face( r_, v1_, v2_, v3_, v4_ );
	result = result + SingIntVec_Face( r_, v2_, v3_, v4_, v1_ );
	result = result + SingIntVec_Face( r_, v3_, v4_, v1_, v2_ );
	result = result + SingIntVec_Face( r_, v4_, v1_, v2_, v3_ );
	result = result ./ 3;
	
end

