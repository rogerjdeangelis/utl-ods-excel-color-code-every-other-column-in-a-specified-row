Ods excel color code every other column in a specified row

I did not know this was possible.

This solution uses an alias so that 'id' could appear first and id can used for conditional
cell highlighting, which requires id appear last. Code also uses 'define x1-x5'.

Excel output
https://tinyurl.com/yczkd5sr

github
https://tinyurl.com/y84lq2m8
https://github.com/rogerjdeangelis/utl-ods-excel-color-code-every-other-column-in-a-specified-row

SAS Forum
https://tinyurl.com/y9f9j2u7
https://communities.sas.com/t5/SAS-Programming/Simple-way-to-color-whole-column-and-color-cell-with-single-rule/m-p/514089

hhchenfx profile
https://communities.sas.com/t5/user/viewprofilepage/user-id/49486

INPUT
=====

 WORK.HAVE total obs=5

  ID    X1    X2    X3    X4    X5

   1     1     2     3     4     5
   2     1     2     3     4     5
   3     1     2     3     4     5
   4     1     2     3     4     5
   5     1     2     3     4     5

EXAMPLE OUTPUT
--------------


 WORK.HAVE total obs=5               | RULES
                                     |
  ID    X1    X2    X3    X4    X5   |
                                     |
   1     1     2     3     4     5   |
   2     1     2     3     4     5   |
   3    Y1Y    2    Y3Y    4    Y5Y  | Y#Y have a yellow background
   4     1     2     3     4     5   |
   5     1     2     3     4     5   |


PROCESS
=======

ods excel file="d:/xls/utl-ods-excel-color-code-every-other-column-in-a-specified-row.xlsx";

proc report data=have nowd missing;
 column id=sid x1-x5 id;

   define sid/ display;
   define x1-x5/ display;
   define id/ display noprint;

   compute  id; /* ID needs to be last */

    if id=3 then do;
       do i = 2 to 6 by 2;      /*column to color*/
          call define(i, "style","style={background=yellow}");
      end;
    end;
    endcomp;

run;quit;
ods excel close;

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

data have;
   do id=1 to 5;
     output;
   end;
   array xs[5] x1-x5 (1,2,3,4,5);
run;quit;





