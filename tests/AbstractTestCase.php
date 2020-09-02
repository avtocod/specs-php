<?php

declare(strict_types=1);

namespace Avtocod\Specifications\Tests;

use PHPUnit\Framework\TestCase;
use Avtocod\Specifications\Specifications;

abstract class AbstractTestCase extends TestCase
{
    /**
     * Get the root directory path.
     *
     * @return string
     */
    protected function getSpecsRootDirPath(): string
    {
        return \dirname(__DIR__) . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR .
               Specifications::AVTOCOD_SPECS_PACKAGE_NAME;
    }
}
