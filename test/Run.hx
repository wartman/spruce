import eg.Keyframes;
import js.Browser;
import pine.*;
import pine.html.*;
import pine.html.client.Client;
import eg.Animated;
import eg.LayerContext;
import spruce.layout.*;
import spruce.core.Box;
import spruce.core.PortalContext;
import spruce.button.Button;
import spruce.modal.*;
import spruce.sidebar.*;
import spruce.collapse.*;
import spruce.grid.*;
import spruce.dropdown.*;
import spruce.menu.*;
import spruce.tab.*;
import spruce.nav.*;
import spruce.typography.*;
import spruce.accordion.Accordion;

using Nuke;

function main() {
  Spruce.useBaseStyles();
  Spruce.useLightColors();
  Spruce.useDefaultTheme();

  mount(
    Browser.document.getElementById('root'),
    () -> new PortalContextProvider({
      value: new PortalContext(Browser.document.getElementById('portal')),
      build: _ -> new App({})
    })
  );
}

class App extends AutoComponent {
  function build() {
    var box = new Box({
      layout: Vertical,
      spacing: Large,
      children: [
        new Toggle({}),
        new Box({
          layout: Horizontal,
          spacing: Small,
          children: [
            new ShowModal({}),
            new ShowSidebar({})
          ]
        }),
        new Grid<4>({
          children: [
            new GridColumn<4, 'md:1'>({
              children: [
                new Collapse({
                  children: [
                    new CollapseHeader({
                      child: 'Test'
                    }),
                    new CollapseBody({
                      children: new Html<'p'>({
                        children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.'
                      })
                    })
                  ]
                })
              ]
            }),
            new GridColumn<4, 'md:2'>({
              children: [
                new Dropdown({
                  toggle: _ -> new DropdownButton({
                    child: 'A dropdown!'
                  }),
                  body: _ -> new DropdownMenu({
                    children: [
                      new MenuItem({ 
                        child: new DropdownMenuLink({
                          kind: Action(() -> trace('bar')),
                          child: 'Bar!'
                        }) 
                      }),
                      new MenuItem({ 
                        child: new DropdownMenuLink({
                          kind: Action(() -> trace('foop')),
                          child: 'Foober!'
                        }) 
                      }),
                      new MenuItem({ 
                        child: new DropdownMenuLink({
                          kind: Action(() -> trace('foop')),
                          child: 'Flop!'
                        }) 
                      }),
                      new MenuItem({ 
                        child: new DropdownMenuLink({
                          kind: Action(() -> trace('foop')),
                          child: 'Frodge!'
                        }) 
                      })
                    ]
                  })
                }),
                new TabExample({})
              ]
            }),
            new GridColumn<4, 'md:1'>({
              children: [
                new Accordion({
                  children: [
                    // new CardHeader({
                    //   children: [
                    //     new Heading({
                    //       level: 5,
                    //       children: 'Accordian Example'
                    //     })
                    //   ]
                    // }),
                    new Collapse({
                      children: [
                        new CollapseHeader({
                          child: 'One' 
                        }),
                        new CollapseBody({
                          children: new Html<'p'>({ 
                            children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                          })
                        }),
                      ]
                    }),
                    new Collapse({
                      borderRadius: Large,
                      children: [
                        new CollapseHeader({
                          child: 'Two' 
                        }),
                        new CollapseBody({
                          children: new Html<'p'>({ 
                            children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                          })
                        }),
                      ]
                    }),
                    new Collapse({
                      children: [
                        new CollapseHeader({
                          child: 'Three' 
                        }),
                        new CollapseBody({
                          children: new Html<'p'>({ 
                            children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                          })
                        }),
                      ]
                    }),
                    new Collapse({
                      children: [
                        new CollapseHeader({
                          child: 'Four' 
                        }),
                        new CollapseBody({
                          children: new Html<'p'>({ 
                            children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                          })
                        }),
                      ]
                    }),
                  ]
                })
              ]
            })
          ]
        })
      ]
    });

    var nav = new Navbar({
      spacing: Small,
      styles: Css.atoms({
        backgroundColor: theme(spruce.color.neutral900),
        color: theme(spruce.color.neutral0),
      }),
      children: [
        new NavbarMobile({
          body: _ -> 'test'
        }),
        new NavbarBrand({
          child: new Heading({
            level: 2,
            children: 'Test'
          })
        })
      ]
    });

    var body = new Container({
      kind: Lg,
      children: box
    });

    return new Fragment([
      nav,
      body
    ]);
  }
}

class Toggle extends AutoComponent {
  @:signal final toggle:Bool = false;

  function build() {
    return new Box({
      styles: [
        Css.atoms({ 
          width: 100.pct(),
          overflow: ' '
        })
      ],
      layout: Vertical,
      spacing: Small,
      children: [
        new Animated({
          keyframes: compute(() -> switch toggle() {
            case true: new Keyframes('in', _ -> [
              { opacity: 1, width: 100.pct() },
              { opacity: 0, width: 0 }
            ]);
            case false: new Keyframes('out', _ -> [
              { opacity: 0, width: 0 },
              { opacity: 1, width: 100.pct() }
            ]);
          }),
          duration: 300,
          onFinished: context -> {
            // @todo: maybe automatically apply these styles
            // as a part of the Animate component?
            var el:js.html.Element = context.getObject();
            el.style.opacity = toggle.peek() ? '0' : '1';
            el.style.width = toggle.peek() ? '0' : 100.pct();
          },
          child: new Box({
            styles: Css.atoms({
              width: 200.px(),
              height: 200.px(),
              background: 'black'
            })
          })
        }),
        new Box({
          children: [
            new Button({
              onClick: _ -> toggle.update(toggle -> !toggle),
              children: [ 'Flip' ]
            })
          ]
        })
      ]
    });
  }
}

class ShowModal extends AutoComponent {
  @:signal final isOpen:Bool = false;

  public function build() {
    return new Fragment([
      new Button({
        priority: Primary,
        onClick: _ -> isOpen.set(true),
        children: [ 'Modal' ]
      }),
      new Show(isOpen, () -> new Modal({
        onHide: () -> isOpen.set(false),
        children: [
          new ModalHeader({
            child: new ModalTitle({ child: 'Test' }) 
          }),
          new ModalBody({ children: [ 'This should work' ] }),
          new Scope(context -> new ModalFooter({
            children: [
              new Button({
                onClick: _ -> LayerContext.from(context).hide(),
                priority: Primary,
                children: [ 'Ok' ]
              }),
              new Button({
                onClick: _ -> LayerContext.from(context).hide(),
                children: [ 'Cancel' ]
              }),
            ]
          }))
        ]
      }))
    ]);
  }
}

class ShowSidebar extends AutoComponent {
  @:signal final isOpen:Bool = false;

  function build() {
    return new Fragment([
      new Button({
        priority: Primary,
        borderRadius: Pill,
        onClick: _ -> isOpen.set(true),
        children: [ 'Sidebar' ]
      }),
      new Show(isOpen, () -> new Sidebar({
        attachment: Right,
        onHide: () -> isOpen.set(false),
        children: [
          new SidebarHeader({
            child: new SidebarTitle({ child: 'Main Menu' })
          }),
          new SidebarBody({
            children: [ 'hey world' ]
          })
        ]
      }))
    ]);
  }
}

class TabExample extends AutoComponent {
  @:signal final variant:TabVariant = TabVariant.Underline;

  function build() {
    var tabs = new Scope(_ -> new TabGroup({
      variant: variant(),
      tabs: [
        new Tab({
          label: _ -> 'One',
          body: _ -> 'Hello World'
        }),
        new Tab({
          label: _ -> 'Two',
          body:  _ -> 'Hello Other World'
        })
      ]
    }));

    var dropdown = new Dropdown({
      toggle: _ -> new DropdownButton({
        child: variant.map(variant -> switch variant {
          case Underline: 'Underline';
          case Pill: 'Pill';
          default: 'Wtf';
        })
      }),
      body: _ -> new DropdownMenu({
        children: [
          new MenuItem({
            child: new DropdownMenuLink({
              kind: Action(() -> variant.set(Underline)),
              child: 'Underline'
            })
          }),
          new MenuItem({
            child: new DropdownMenuLink({
              kind: Action(() -> variant.set(Pill)),
              child: 'Pill'
            })
          })
        ]
      })
    });

    return new Box({
      spacing: Medium,
      layout: Vertical,
      children: [
        new Box({ children: dropdown }),
        tabs
      ]
    });
  }
}
