<?php

try {
    $D = new PDO('mysql:host=host.docker.internal;dbname=test;port=33060', 'root', 'foo123');
    echo "ok\n";
    $D->beginTransaction();

    $D->exec("DROP TABLE IF EXISTS bla;");
    $D->exec("CREATE TABLE bla(id serial, name TEXT)");

    $S = $D->prepare('INSERT INTO bla(name) VALUES (:name);');
    $S->bindParam(':name', $p1);
    $p1 = "bob";
    $S->execute();
    $S = null;

    $S = $D->prepare('INSERT INTO bla(name) VALUES (?);');
    $S->bindValue(1, "hoho");
    $S->execute();
    $S = null;




    if ($D->inTransaction()) {
        $D->commit();
    }

    $D = null;
} catch (PDOException $e) {
    echo "error $e\n";
    if ($D->inTransaction()) {
        $D->rollBack();
    }

}
