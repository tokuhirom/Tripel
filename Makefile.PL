use inc::Module::Install;

all_from 'Tripel.pm';

readme_markdown_from('Tripel.pm');

requires 'Text::Xslate';
requires 'Text::Xslate::Bridge::TT2Like';
requires 'Router::Simple::Sinatraish';
requires 'Mouse';
requires 'HTML::FillInForm::Lite';
requires 'Plack';

WriteAll;
