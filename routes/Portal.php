<?php

namespace routes;

class Portal
{
    private $_mailApi = null;
    public function __construct($app, $ui)
    {
        $this->app = $app;
        $this->ui = $ui;
        $this->helper = new \library\Helper($this);

        // init api module
        $this->_mailApi = new \api\Mailer($this);

        // hook all route add ui global data
        $this->app->hook('slim.before.router', array($this, 'dispatchUiGlobalData'));

        // portal routing
        $this->app->get('/', array($this, 'getIndex'))->name('index');
    }
    public function getIndex()
    {
        echo $this->ui->render('index/index.html.twig');
    }
    public function dispatchUiGlobalData()
    {
        // route data
        $request = $this->app->request();
        $this->ui->addGlobal('base_url', $request->getRootUri());
        $this->ui->addGlobal('resource_url', $request->getResourceUri());
    }
}

