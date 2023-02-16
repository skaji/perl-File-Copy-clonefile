#ifdef __cplusplus
extern "C" {
#endif

#define PERL_NO_GET_CONTEXT /* we want efficiency */
#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#ifdef __cplusplus
} /* extern "C" */
#endif

#define NEED_newSVpvn_flags
#include "ppport.h"

#include <sys/attr.h>
#include <sys/clonefile.h>

MODULE = File::Copy::clonefile  PACKAGE = File::Copy::clonefile

PROTOTYPES: DISABLE

void
clonefile(...)
PPCODE:
{
  if (items != 2) {
    croak("items != 2");
  }

  SV* src = ST(0);
  STRLEN src_len;
  const char* src_char = SvPV(src, src_len);

  SV* dst = ST(1);
  STRLEN dst_len;
  const char* dst_char = SvPV(dst, dst_len);

  if (clonefile(src_char, dst_char, 0) == 0) {
    XPUSHs(boolSV(TRUE));
  } else {
    XPUSHs(&PL_sv_undef);
  }
  XSRETURN(1);
}
