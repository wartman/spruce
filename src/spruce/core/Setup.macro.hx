package spruce.core;

import breeze.Config;

using StringTools;

function setup() {
  var config = Config.instance();
  registerColor(config, 'neutral');
  registerColor(config, 'primary');
  registerColor(config, 'secondary');
  registerColor(config, 'success');
  registerColor(config, 'warning');
  registerColor(config, 'danger');

  config.colors.get('neutral').set('0', 'var(--spruce-color-neutral-0)');
  config.colors.get('neutral').set('1000', 'var(--spruce-color-neutral-1000)');

  // @todo: Still need `warning`.
  config.preflight.set('light-colors', prepareCss(':root{
    --spruce-color-neutral-0: rgb(255, 255, 255);
    --spruce-color-neutral-50: rgb(249, 249, 249);
    --spruce-color-neutral-100: rgb(244, 244, 245);
    --spruce-color-neutral-200: rgb(228, 228, 231);
    --spruce-color-neutral-300: rgb(212, 212, 216);
    --spruce-color-neutral-400: rgb(161, 161, 171);
    --spruce-color-neutral-500: rgb(113, 113, 122);
    --spruce-color-neutral-600: rgb(82, 82, 91);
    --spruce-color-neutral-700: rgb(63, 63, 70);
    --spruce-color-neutral-800: rgb(39, 39, 42);
    --spruce-color-neutral-900: rgb(24, 24, 27);
    --spruce-color-neutral-950: rgb(19, 19, 22);
    --spruce-color-neutral-1000: rgb(0, 0, 0);
    
    --spruce-color-primary-50: rgb(240, 249, 255);
    --spruce-color-primary-100: rgb(224, 242, 254);
    --spruce-color-primary-200: rgb(186, 230, 253);
    --spruce-color-primary-300: rgb(125, 211, 252);
    --spruce-color-primary-400: rgb(56, 189, 248);
    --spruce-color-primary-500: rgb(14, 165, 233);
    --spruce-color-primary-600: rgb(2, 132, 199);
    --spruce-color-primary-700: rgb(3, 105, 161);
    --spruce-color-primary-800: rgb(7, 89, 133);
    --spruce-color-primary-900: rgb(12, 74, 110);
    --spruce-color-primary-950: rgb(11, 50, 73);

    --spruce-color-secondary-50: rgb(249, 249, 249);
    --spruce-color-secondary-100: rgb(244, 244, 245);
    --spruce-color-secondary-200: rgb(228, 228, 231);
    --spruce-color-secondary-300: rgb(212, 212, 216);
    --spruce-color-secondary-400: rgb(161, 161, 171);
    --spruce-color-secondary-500: rgb(113, 113, 122);
    --spruce-color-secondary-600: rgb(82, 82, 91);
    --spruce-color-secondary-700: rgb(63, 63, 70);
    --spruce-color-secondary-800: rgb(39, 39, 42);
    --spruce-color-secondary-900: rgb(24, 24, 27);
    --spruce-color-secondary-950: rgb(19, 19, 22);

    --spruce-color-success-50: rgb(240, 253, 244);
    --spruce-color-success-100: rgb(220, 252, 231);
    --spruce-color-success-200: rgb(187, 247, 208);
    --spruce-color-success-300: rgb(134, 239, 172);
    --spruce-color-success-400: rgb(74, 222, 128);
    --spruce-color-success-500: rgb(34, 197, 94);
    --spruce-color-success-600: rgb(22, 163, 74);
    --spruce-color-success-700: rgb(21, 128, 61);
    --spruce-color-success-800: rgb(22, 101, 52);
    --spruce-color-success-900: rgb(20, 83, 45);
    --spruce-color-success-950: rgb(12, 49, 27);

    --spruce-color-danger-50: rgb(254, 242, 242);
    --spruce-color-danger-100: rgb(254, 226, 226);
    --spruce-color-danger-200: rgb(254, 202, 202);
    --spruce-color-danger-300: rgb(252, 165, 165);
    --spruce-color-danger-400: rgb(248, 113, 113);
    --spruce-color-danger-500: rgb(239, 68, 68);
    --spruce-color-danger-600: rgb(220, 38, 38);
    --spruce-color-danger-700: rgb(185, 28, 28);
    --spruce-color-danger-800: rgb(153, 27, 27);
    --spruce-color-danger-900: rgb(127, 29, 29);
    --spruce-color-danger-950: rgb(80, 20, 20);
  }'));
  config.preflight.set('dark-colors', prepareCss('@media screen and (prefers-color-scheme:dark) {
    :root {
      /* todo */
    }
  }'));
}

private function registerColor(config:Config, color:String) {
  config.colors.set(color, [ for (intensity in ['50', '100', '200', '300', '400', '500', '600', '700', '800', '900', '950']) intensity => 'var(--spruce-color-$color-$intensity)']);
}

private function prepareCss(css:String) {
  return css.split('\n').map(part -> part.trim()).join('');
}
