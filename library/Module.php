<?php

namespace library;

abstract class Module
{
    public function __construct($portal)
    {
        $this->portal = $portal;
        $this->app = $portal->app;
        $this->ui = $portal->ui;
        $this->helper = $portal->helper;
        $this->init();
    }
    abstract protected function init();
}

