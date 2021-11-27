namespace my.bookshop;

entity Books {
  key ID    : Integer;
      title : String;
      stock : Integer;
      user  : String;
}

entity Tasks {
  key ID   : Integer;
      task : String;
      user : Association to Users;
}

entity Users {
  key user  : String;
      name  : String;
      tasks : Association to many Tasks
                on tasks.user = $self;
}
