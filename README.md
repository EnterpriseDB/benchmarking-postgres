Benchmarking-postgres:
------------------------------

This contains scripts to benchmark PostgreSQL database server using pgbench and HammerDB.

Install the server:
------------------------------

1. Please note that PostgreSQL YUM repository depends on EPEL repository for some packages. RHEL/CentOS/, etc. users should install EPEL repo RPM along with PGDG repo RPMs to satisfy dependencies.

sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

2. Download the rpm from https://yum.postgresql.org/repopackages.php#pg12

rpm -ivh pgdg-redhat-repo-latest.noarch.rpm

For edbas, install the repo as following.

sudo cp edb.repo /etc/yum.repos.d/

3. sudo yum makecache

4. sudo yum install postgresql12-server

Install HammerDB
------------------------------

1. Download the Linux 64-bit compressed tar file for HammerDB from the following link:

https://www.hammerdb.com/download.html

2. To install from the tar.gz run the command

tar -zxvf HammerDB-3.0.tar.gz

Run benchmarking
------------------------------

1. Edit run_tests and set the following postgres folder and hammerdb folder in
the following two variables respectively:

		export PGINST=/usr/pgsql-12/
		export HDBINST=/home/centos/HammerDB/HammerDB-3.2

2. Add/modify the postgresql parameters in run_tests.

3. The pgbench specific parameters can be found in PGBench/run_pgbench script.
If the WAL needs to be stored in separate directory, the wal_dir variable should
be set with the location.

4. The HammerDB specific parameters can be found in HammerDB/run_hammerdb script.
If the WAL needs to be stored in separate directory, the wal_dir variable should
be set with the location.

5. Run ./run_test

6. The results will be generated in PGBench/Results and HammerDB/Results folder.
