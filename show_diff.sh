#! /usr/bin/env bash

set -eu 

# ostree diff commit from: booted deployment (e260e7b9221e52ba928f04ea51d8e82cca85b9ba8f552e58da25ece61d46fb18)
# ostree diff commit to:   pending deployment (41c7b5ec5a63d04fab876cba22019b305bdfd84cf4ad231d1466892226198a3f)

OLD=e260e7b9221e52ba928f04ea51d8e82cca85b9ba8f552e58da25ece61d46fb18
NEW=907453eae1e4a535e7421d6d95efc5c50f71a449fd3334862ba3f9e3fa30c69a
diff --brief --no-dereference --recursive /sysroot/ostree/deploy/default/deploy/$OLD.0/usr/etc /sysroot/ostree/deploy/default/deploy/$NEW.0/usr/etc/ | grep -v shadow

#Files /sysroot/ostree/deploy/default/deploy/edf54e8107a56352acf917f50b56a20fb8f44c48a0ca614f0466d1fe5d5aea14.0/usr/etc/shadow and /sysroot/ostree/deploy/default/deploy/e260e7b9221e52ba928f04ea51d8e82cca85b9ba8f552e58da25ece61d46fb18.0/usr/etc/shadow differ
#Files /sysroot/ostree/deploy/default/deploy/edf54e8107a56352acf917f50b56a20fb8f44c48a0ca614f0466d1fe5d5aea14.0/usr/etc/shadow- and /sysroot/ostree/deploy/default/deploy/e260e7b9221e52ba928f04ea51d8e82cca85b9ba8f552e58da25ece61d46fb18.0/usr/etc/shadow- differ
ostree diff commit from: booted deployment (e260e7b9221e52ba928f04ea51d8e82cca85b9ba8f552e58da25ece61d46fb18)
ostree diff commit to:   pending deployment (907453eae1e4a535e7421d6d95efc5c50f71a449fd3334862ba3f9e3fa30c69a)
