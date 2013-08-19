use strict;
use warnings;

use Test::More;
BEGIN { use_ok('Riak::PBC') };

use Riak::PBC;

subtest "RpbGetReq" => sub {
    my $req = Riak::PBC::RpbGetReq->new;
    $req->set_bucket('foo');
    $req->set_key('key');
    $req->set_sloppy_quorum(1);
    $req->set_r(1);
    $req->set_n_val(1);
    
    my $packed_req = $req->pack;
    
    undef $req;
    
    my $unpacked_req = Riak::PBC::RpbGetReq->new;
    $req = $unpacked_req->unpack($packed_req);

    is $unpacked_req->bucket, 'foo', 'backet is same';
    is $unpacked_req->key, 'key', 'key is same';
    ok $unpacked_req->sloppy_quorum, 'pack -> unpack';
    is $unpacked_req->r, 1, 'r is same';
    is $unpacked_req->n_val, 1, 'n_val is same';
};

subtest "RpbPutReq" => sub {
    # Content
    my $content = Riak::PBC::RpbContent->new;
    $content->set_value('test value');

    # PutReq
    my $req = Riak::PBC::RpbPutReq->new;
    $req->set_bucket('foo');
    $req->set_key('key');
    $req->set_content($content);
    $req->set_sloppy_quorum(1);
    $req->set_w(3);
    $req->set_n_val(1);
    
    my $packed_req = $req->pack;
    undef $req;
    undef $content;
    
    my $unpacked_req = Riak::PBC::RpbPutReq->new;
    $req = $unpacked_req->unpack($packed_req);

    is $unpacked_req->bucket, 'foo', 'backet is same';
    is $unpacked_req->key, 'key', 'key is same';
    ok $unpacked_req->sloppy_quorum, 'pack -> unpack';
    is $unpacked_req->w, 3, 'r is same';
    is $unpacked_req->n_val, 1, 'n_val is same';

    $content = $unpacked_req->content;

    is $content->value, 'test value', 'pack -> unpack ok';
};

subtest "RpbDelReq" => sub {
    my $req = Riak::PBC::RpbDelReq->new;
    $req->set_bucket('foo');
    $req->set_key('key');
    $req->set_sloppy_quorum(1);
    $req->set_r(1);
    $req->set_w(1);
    $req->set_n_val(1);
    
    my $packed_req = $req->pack;
    
    undef $req;
    
    my $unpacked_req = Riak::PBC::RpbDelReq->new;
    $req = $unpacked_req->unpack($packed_req);

    is $unpacked_req->bucket, 'foo', 'backet is same';
    is $unpacked_req->key, 'key', 'key is same';
    ok $unpacked_req->sloppy_quorum, 'pack -> unpack';
    is $unpacked_req->r, 1, 'r is same';
    is $unpacked_req->w, 1, 'w is same';
    is $unpacked_req->n_val, 1, 'n_val is same';
};

done_testing;
