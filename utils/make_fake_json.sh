#!/bin/bash
#

python ../apps/manage.py shell << EOF
from users.models import *
generate_fake()
from assets.models import *
generate_fake()
EOF

python ../apps/manage.py dbshell << EOF
delete from django_content_type;
delete from auth_permission;
EOF


python ../apps/manage.py dumpdata > ../apps/fixtures/fake.json