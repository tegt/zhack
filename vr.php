<?php
$da = basename($argv[0]);
if (empty($extra)) $extra = '';
if (is_file('/home/tegt/staging')) {
    echo "Staging\n";
    if (isset($staging))
            echo "$staging$extra\n";
    else
        echo "/var/www/vhosts/deststudios.com/$da.deststudios.com/v\n";
    exit(0);
}
foreach (array('/rrr/', '/vvv/') as $dx) {
    $d = '/home/tegt/d/'.$da.$dx;
    foreach (array('x', 'v', 'r', 'rrr', 'vvv') as $xx) {
        if (is_dir($d.$xx)) {
            break;
        }
    }
    $dns[] = $d.$xx;
}

function showDir($dn) {
    global $extra;
    if (is_dir($dn))  {
        if (count(scandir($dn)) > 2)
            echo "$dn$extra\n";
        else
            echo "EMPTY $dn$extra\n";
    }
    else {
        echo "MISSING $dn$extra\n";
    }
}

if ($argc == 1) { // No arg echo dirs status
    foreach ($dns as $dn) {
        showDir($dn);
    }
}
else {

    switch ($argv[1]) {
    case 'u': // unmount
        passthru('fusermount -u '.$dns[0], &$r);
        showDir($dns[0]);
        break;

    case 'a': // mount all
        $mnt = '';
        // nobreak;

    case 'm': // mount
        if (isset($passwd) && $passwd <> '') {
            readline ($passwd."\n");
        }
        $cmd = 'sshfs -C '.$usr.'@'.$url.':'.$mnt.' '.$dns[0];
        echo "--$cmd--\n";
        passthru($cmd , &$r);
        showDir($dns[0]);
        break;

    case 'v': // virtual + restart
        @unlink('/var/www');
        symlink($dns[1], '/var/www');
        passthru('sudo apache2ctl restart');
        showDir($dns[1]);
        break;

    case 'r': // rsync echo
        echo 'rsync -avz '.$usr.'@'.$url.':'.$mnt.' '.$dns[1]."\n";
        break;

    case 's': // shell
        echo 'cd '.$mnt."\n";
        echo $da."-shell\n";
        passthru('ssh '.$usr.'@'.$url);
        break;

    default:
        echo '--------Unknown arg:"'.$argv[1]."\"\n";
        break;
    }

}