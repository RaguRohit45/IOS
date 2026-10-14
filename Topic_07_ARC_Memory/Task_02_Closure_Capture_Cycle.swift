final class Downloader {
    let name: String
    var onFinish: (() -> Void)?

    init(name: String) { self.name = name }

    func start() {
        onFinish = { [weak self] in
            guard let self else { return }
            print("Finished \(self.name)")
        }
    }

    deinit { print("Downloader \(name) deallocated") }
}

do {
    var downloader: Downloader? = Downloader(name: "File A")
    downloader?.start()
    downloader?.onFinish?()
    downloader = nil
}
