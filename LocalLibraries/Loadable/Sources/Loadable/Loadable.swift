public enum Loadable<T: Equatable, E: Equatable> : Equatable{
    case loaded(T)
    case loading
    case error(E)
    
    public init() {
        self = .loading
    }
    
    public mutating func setLoadedState(_ input: T) {
        self = .loaded(input)
    }
    public mutating func setErrorState(_ error: E) {
        self = .error(error)
    }
}
