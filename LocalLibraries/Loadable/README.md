# Loadable :hourglass:
`Loadable<T,E>`
A very simple enum wrapper for conveying pending types. For instance: `Loadable<Response, NSError>` starts off with a `.loading` value on init.

Once your WebTask/AsyncTask is finished, it can assign Loadable with `.loaded(T)` where `T` is your chosen value as long as `T` conforms to the `Equatable` protocol.


