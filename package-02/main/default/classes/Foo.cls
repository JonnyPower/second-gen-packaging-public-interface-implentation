public class Foo {
	public class FooInner implements IFoo, IBar {
		public void foo() {
			System.debug('foo');
		}
		public void bar() {
			System.debug('bar');
		}
	}
	public class Foo2Inner implements IFoo, IBar {
		public void foo() {
			((IFoo) new FooInner()).foo();
		}
		public void bar() {
			((IBar) new FooInner()).bar();
		}
	}
}
