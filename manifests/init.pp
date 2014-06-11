#configuration for grafana

class grafana{

    vcsrepo {"/opt/grafana":
        ensure => present,
        provider => git,
        source => 'https://github.com/torkelo/grafana.git',
        revision => 'master',
    }


    file {'/opt/grafana':
       ensure => present,
       require => Vcsrepo["/opt/grafana"],
    }


    file {"config.js":
        path => "/opt/grafana/src/config.js",
        ensure => file,
        owner   => "root",
        group   => "root",
        mode    => "0644",
        content => template("grafana/config.js.erb"),
   }


    
    file {'/opt/grafana/src/app/dashboards/hearteater.json':
        ensure => present,
        source => 'puppet:///modules/grafana/hearteater.json',
        mode => '0644',
    }


    file {'/opt/grafana/src/app/dashboards/oathkeeper.json':
        ensure => present,
        source => 'puppet:///modules/grafana/oathkeeper.json',
        mode => '0644',
    }    


    file {'/opt/grafana/src/app/dashboards/mary.json':
        ensure => present,
        source => 'puppet:///modules/grafana/mary.json',
        mode => '0644',
    }

    file {'/opt/grafana/src/app/dashboards/cosmo.json':
        ensure => present,
        source => 'puppet:///modules/grafana/cosmo.json',
        mode => '0644',
    }

    file {'/opt/grafana/src/app/dashboards/inventory.json':
        ensure => present,
        source => 'puppet:///modules/grafana/inventory.json',
        mode => '0644',
    }

     file {'/opt/grafana/src/app/dashboards/ecom.json':
         ensure => present,
         source => 'puppet:///modules/grafana/ecom.json',
         mode => '0644',
     }
                                

    file {'/etc/httpd/conf/extra/vhosts-enabled/grafana-vhosts.conf':
        ensure => present,
        source => 'puppet:///modules/grafana/grafana-vhosts.conf',
        mode => '0644',
    }
}
