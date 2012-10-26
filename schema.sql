create table Subjects
   (sn                              integer primary key,
    cookie_id         text          not null unique,
    cookie_expires_t  integer       not null,
    ip                text          not null,
    consented_t       integer       not null,
    task_version      text          not null,
    completed_t       integer,
    completion_key    text);

create table MTurk
   (sn              integer         unique
      references Subjects(sn),
      -- When sn is null, this row represents an MTurk worker who
      -- wasn't a subject in this study but who we want to
      -- exclude (because they did a similiar study, presumably).
    workerid        text            not null,
    hitid           text            not null,
    assignmentid    text            not null,
    submit_to       text            not null,
    reconciled      integer         not null);

create table Timing
   (sn             integer          not null
      references Subjects(sn),
    k              text             not null,
    first_sent     integer          not null,
    received       integer,
    primary key (sn, k));

create table D
   (sn             integer          not null
      references Subjects(sn),
    k              text             not null,
    v              text,
    primary key (sn, k));