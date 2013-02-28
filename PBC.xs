#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif

// Taken from Glib and Gtk

static void
call_XS ( pTHX_ void (*subaddr) (pTHX_ CV *), CV * cv, SV ** mark )
{
  dSP;
  PUSHMARK (mark);
  (*subaddr) (aTHX_ cv);
  PUTBACK;
}

#define CALL_BOOT(name)	call_XS (aTHX_ name, cv, mark)

// We need these declarations with "C" linkage

#ifdef __cplusplus
extern "C" {
#endif
  XS(boot_Riak__PBC__RpbErrorResp);
  XS(boot_Riak__PBC__RpbGetClientIdResp);
  XS(boot_Riak__PBC__RpbSetClientIdReq);
  XS(boot_Riak__PBC__RpbGetServerInfoResp);
  XS(boot_Riak__PBC__RpbGetReq);
  XS(boot_Riak__PBC__RpbGetResp);
  XS(boot_Riak__PBC__RpbPutReq);
  XS(boot_Riak__PBC__RpbPutResp);
  XS(boot_Riak__PBC__RpbDelReq);
  XS(boot_Riak__PBC__RpbListBucketsResp);
  XS(boot_Riak__PBC__RpbListKeysReq);
  XS(boot_Riak__PBC__RpbListKeysResp);
  XS(boot_Riak__PBC__RpbGetBucketReq);
  XS(boot_Riak__PBC__RpbGetBucketResp);
  XS(boot_Riak__PBC__RpbSetBucketReq);
  XS(boot_Riak__PBC__RpbBucketProps);
  XS(boot_Riak__PBC__RpbMapRedReq);
  XS(boot_Riak__PBC__RpbMapRedResp);
  XS(boot_Riak__PBC__RpbPair);
  XS(boot_Riak__PBC__RpbIndexReq);
  XS(boot_Riak__PBC__RpbIndexResp);
  XS(boot_Riak__PBC__RpbContent);
  XS(boot_Riak__PBC__RpbLink);
#ifdef __cplusplus
}
#endif

// Bootstrap this module by bootstrapping all of the others.

MODULE = Riak::PBC	PACKAGE = Riak::PBC

BOOT:
    CALL_BOOT(boot_Riak__PBC__RpbErrorResp);
    CALL_BOOT(boot_Riak__PBC__RpbGetClientIdResp);
    CALL_BOOT(boot_Riak__PBC__RpbSetClientIdReq);
    CALL_BOOT(boot_Riak__PBC__RpbGetServerInfoResp);
    CALL_BOOT(boot_Riak__PBC__RpbGetReq);
    CALL_BOOT(boot_Riak__PBC__RpbGetResp);
    CALL_BOOT(boot_Riak__PBC__RpbPutReq);
    CALL_BOOT(boot_Riak__PBC__RpbPutResp);
    CALL_BOOT(boot_Riak__PBC__RpbDelReq);
    CALL_BOOT(boot_Riak__PBC__RpbListBucketsResp);
    CALL_BOOT(boot_Riak__PBC__RpbListKeysReq);
    CALL_BOOT(boot_Riak__PBC__RpbListKeysResp);
    CALL_BOOT(boot_Riak__PBC__RpbGetBucketReq);
    CALL_BOOT(boot_Riak__PBC__RpbGetBucketResp);
    CALL_BOOT(boot_Riak__PBC__RpbSetBucketReq);
    CALL_BOOT(boot_Riak__PBC__RpbBucketProps);
    CALL_BOOT(boot_Riak__PBC__RpbMapRedReq);
    CALL_BOOT(boot_Riak__PBC__RpbMapRedResp);
    CALL_BOOT(boot_Riak__PBC__RpbPair);
    CALL_BOOT(boot_Riak__PBC__RpbIndexReq);
    CALL_BOOT(boot_Riak__PBC__RpbIndexResp);
    CALL_BOOT(boot_Riak__PBC__RpbContent);
    CALL_BOOT(boot_Riak__PBC__RpbLink);
