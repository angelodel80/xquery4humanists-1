xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";

declare variable $text := <text xmlns="http://www.tei-c.org/ns/1.0">
    <div xml:id="ch1">
        <head>Chapter One</head>
        <div xml:id="ch1.1">
            <head>Introduction</head>
            <!-- Text of Chapter One Introduction -->
        </div>
        <div xml:id="ch1.2">
            <head>Section 1</head>
            <!-- Text of Chapter One Section 1 -->
            <div xml:id="ch1.2.1">
                <head>Subsection 1</head>
                <!-- Text of Chapter One Section 1 Subsection 1 -->
            </div>
            <div xml:id="ch1.2.2">
                <head>Subsection 2</head>
                <!-- Text of Chapter One Section 1 Subsection 2 -->
            </div>
        </div>
    </div>
    <div xml:id="ch2">
        <head>Chapter Two</head>
        <div xml:id="ch2.1">
            <head>Introduction</head>
            <!-- Text of Chapter Two Introduction -->
        </div>
        <div xml:id="ch2.2">
            <head>Section 1</head>
            <!-- Text of Chapter Two Section 1 -->
            <div xml:id="ch2.2.1">
                <head>Subsection 1</head>
                <!-- Text of Chapter Two Section 1 Subsection 1 -->
            </div>
            <div xml:id="ch2.2.2">
                <head>Subsection 2</head>
                <!-- Text of Chapter Two Section 1 Subsection 2 -->
            </div>
        </div>
    </div>
</text>;

declare function local:toc($originals as node()*) {
    for $original in $originals
    return
        typeswitch ($original)
            case element(tei:text) return
                <nav>
                    <h2>Table of Contents</h2>
                    <ul>{ local:toc($original/node()) }</ul>
                </nav>
            case element(tei:div) return
                <li>
                    <a href="#{ $original/@xml:id }">{
                        local:toc($original/tei:head)
                    }</a>
                    {
                        if ($original/tei:div) then
                            <ul>{
                                local:toc($original/tei:div) 
                            }</ul>
                        else 
                            ()
                    }
                </li>
            case element(tei:head) return
                $original/string()
            case element() return
                local:toc($original/node())
            default return
                ()
};

local:toc($text)
