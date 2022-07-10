import seed.style.BoxDecoration;
import js.Browser;
import pine.*;
import pine.html.*;
import pine.html.dom.DomBootstrap;
import seed.*;
import seed.Sidebar;
import seed.PortalContext;
import seed.style.Breakpoint;

using Nuke;

function main() {
  Seed.useBaseStyles();

  // @todo: (for Nuke) we need a way to scope Theme with
  // media queries.
  Theme.global({
    seed: {
      font: {
        family: 'system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", "Noto Sans", "Liberation Sans", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"'
      },
      color: {
        // Stolen from bootstrap atm
        primary: rgb(13, 110, 253),
        secondary: rgb(108, 117, 125),
        success: rgb(25,135,84),
        info: rgb(13,202,240),
        warning: rgb(255,193,7),
        danger: rgb(220,53,69),
        light: rgb(248,249,250),
        dark: rgb(33,37,41),
        scrim: rgba(0,0,0,0.7)
      },
      priority: {
        primary: {
          bgColor: theme(seed.color.primary),
          color: theme(seed.color.light)
        },
        secondary: {
          bgColor: theme(seed.color.secondary),
          color: theme(seed.color.light)
        }
        // etc
      },
      box: {
        padding: {
          y: .5.rem(),
          x: .75.rem()
        },
      },
      rounded: {
        border: {
          radius: .75.rem()
        },
        padding: {
          y: .75.rem(),
          x: 1.rem()
        }
      },
      grid: {
        gap: 1.5.rem(),
        yGap: theme(seed.grid.gap),
        xGap: theme(seed.grid.gap) * .5
      },
      card: {
        bg: {
          color: theme(seed.color.secondary),
        }
      },
      dropdownMenu: {
        bgColor: theme(seed.color.dark),
        color: theme(seed.color.light),
        hilightBgColor: rgba(255,255,255,0.2),
      }
    }
  });

  var boot = new DomBootstrap(Browser.document.getElementById('root'));
  boot.mount(new PortalContextProvider({
    create: () -> new PortalContext(Browser.document.getElementById('portal')),
    dispose: _ -> null,
    render: _ -> render()
  }));
}

function render() {
  return new Fragment({
    children: [
      new SiteHeader({
        items: [
          new MenuItem({ 
            child: new MenuLink({
              kind: Action(() -> trace('foo')),
              child: 'Foo!'
            })
          }),
          new MenuItem({ 
            child: new MenuLink({
              kind: Action(() -> trace('bar')),
              child: 'Bar!'
            })
          })
        ]
      }),
      new Container({
        kind: Lg,
        styles: Css
          .atoms({ marginTop: theme(seed.grid.yGap) })
          .with(Theme.define({
            seed: {
              card: {
                bgColor: theme(seed.color.info)
              }
            }
          })),
        children: [
          new Grid<4>({
            // @todo: Should `width: 100.pct()` be the default?
            styles: Css.atoms({ width: 100.pct() }),
            children: [
              new GridColumn<4, 'md:2', 'lg:3'>({
                children: [
                  new Html<'p'>({ children: 'Some text' }),
                  new ShowModal({})
                ]
              }),
              new GridColumn<4, 'md:2', 'lg:1'>({
                children: [
                  new Box({
                    layout: Vertical,
                    children: [
                      new Card({
                        children: [
                          new Html<'p'>({ children: [ 'Hey world' ] }),
                          new Dropdown({
                            label: 'A dropdown!',
                            child: new DropdownMenu({
                              items: [
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
                                })
                              ]
                            })
                          })
                        ]
                      }),
                      new Collapse({
                        children: [
                          new CollapseHeader({
                            child: 'Some Collapsed Thingie' 
                          }),
                          new CollapseBody({
                            children: new Html<'p'>({ 
                              children: 'Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.' 
                            })
                          }),
                        ]
                      }),

                      new Accordian({
                        styles: Card.baseStyles,
                        children: [
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
                      }),

                      // Shows how to make Accordian sticky:
                      new Accordian({
                        sticky: true,
                        styles: Card.baseStyles,
                        children: [
                          new Scope({
                            render: context -> new Box({
                              layout: Horizontal,
                              children: [
                                new Button({
                                  onClick: _ -> AccordianContext.from(context).hideAll(),
                                  children: 'Hide'
                                }),
                                new Isolate({
                                  wrap: _ -> new Button({
                                    onClick: _ -> AccordianContext.from(context).toggleSticky(),
                                    children: if (AccordianContext.from(context).isSticky)
                                      'Unstick'
                                    else
                                      'Stick'
                                  })
                                })
                              ]
                            })
                          }),
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
          })
        ]
      })
    ]
  });
}

class ShowModal extends ObserverComponent {
  @track var isOpen:Bool = false;

  public function render(context:Context) {
    return new Fragment({
      children: [
        new Button({
          priority: Primary,
          onClick: _ -> isOpen = true,
          children: [ 'Click me' ]
        }),
        if (isOpen) new Modal({
          styles: Theme.define({
            seed: {
              modalHeader: {
                bgColor: theme(seed.color.primary),
                color: theme(seed.color.light)
              }
            }
          }),
          onHide: () -> isOpen = false,
          children: [
            new ModalHeader({ 
              child: new ModalTitle({ child: 'Test' }) 
            }),
            new ModalBody({ children: [ 'This should work' ] }),
            new ModalFooter({
              children: [
                new Button({
                  onClick: _ -> isOpen = false,
                  priority: Primary,
                  children: [ 'Ok' ]
                }),
                new Button({
                  onClick: _ -> isOpen = false,
                  priority: Secondary,
                  children: [ 'Cancel' ]
                }),
              ]
            })
          ]
        }) else null
      ] 
    });
  }
}

class SiteHeader extends ObserverComponent {
  @prop final items:Array<MenuItem>;
  @track var isOpen:Bool = false;

  function render(context:Context) {
    return new Navbar({
      tag: Header,
      styles: Theme.define({
        seed: {
          navbar: {
            bgColor: theme(seed.color.primary),
            color: theme(seed.color.light)
          }
        }
      }),
      children: [   
        new Button({
          styles: Breakpoint.md({ display: [ 'none', '!important' ] }),
          onClick: _ -> isOpen = true,
          children: [ 'Menu' ]
        }), 
        new NavbarBrand({ 
          styles: Css.atoms({ flexGrow: 3 }), 
          child: new Html<'h1'>({ children: [ 'Test' ] }) 
        }),
        new NavbarMenu({
          styles: [
            Css.atoms({ display: 'none' }),
            Breakpoint.md({ display: 'flex' })
          ],
          items: items
        }),
        if (isOpen)
          new Sidebar({
            attachment: Left,
            onHide: () -> isOpen = false,
            children: [
              new SidebarHeader({
                child: new SidebarTitle({ child: 'Main Menu' })
              }),
              new SidebarBody({
                children: [
                  new Menu({
                    layout: Vertical,
                    items: items
                  })
                ]
              })
            ]
          })
        else
          null
      ]
    });
  }
}
