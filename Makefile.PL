use ExtUtils::MakeMaker;

$CC = 'g++';

# Generate the C++, XS, and Perl files that we need.

my $protoxs = "protoxs --cpp_out=. --out=PBC riak.proto";

print "Generating C++ and Perl/XS sources...\n";
print "$protoxs\n";

`$protoxs`;
`rm -f PBC/*.pm`;
`mv PBC/*.xs .`;

# Now write the Makefile.

WriteMakefile(
    'NAME'          => 'Riak::PBC',
    'VERSION_FROM'  => 'PBC.pm',
    'OPTIMIZE'      => '-O2 -Wall',
    'CC'            => $CC,
    'LD'            => '$(CC)',
    'CCFLAGS'       => '-fno-strict-aliasing',
    'OBJECT'        => 'riak.pb.o PBC.o RpbErrorResp.o RpbGetClientIdResp.o RpbSetClientIdReq.o RpbGetServerInfoResp.o RpbGetReq.o RpbGetResp.o RpbPutReq.o RpbPutResp.o RpbListBucketsReq.o RpbListBucketsResp.o RpbListKeysReq.o RpbListKeysResp.o RpbGetBucketReq.o RpbGetBucketResp.o RpbSetBucketReq.o RpbBucketProps.o RpbMapRedReq.o RpbMapRedResp.o  RpbDelReq.o RpbPair.o RpbContent.o RpbLink.o RpbIndexReq.o RpbIndexResp.o',
    'INC'           =>  " -I/usr/include",
    'LIBS'          => [" -L/usr/lib64 -lprotobuf"],
    'XSOPT'         => '-C++',
    clean           => { FILES => "PBC/* Rpb* lib riak.pb.h riak.pb.cc MANIFEST" }
);
