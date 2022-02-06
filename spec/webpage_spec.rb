require 'webpage'

describe Webpage do
  let(:valid_url) { 'http://www.example.com' }
  let(:invalid_url) { 'invalid_url' }

  let(:html_body) do
    '<html>
      <head></head>
    <body>
      <img src="img1.jpg" alt="img_1" width="500" height="600">
      <img src="img2.jpg" alt="img_2" width="500" height="600">
      <img src="img3.jpg" alt="img_3" width="500" height="600">
      <img src="img4.jpg" alt="img_4" width="500" height="600">
      <img src="img5.jpg" alt="img_5" width="500" height="600">

      <a href="https://www.example1.com">link 1</a>
      <a href="https://www.example2.com">link 1</a>
      <a href="https://www.example3.com">link 1</a>
      <a href="https://www.example4.com">link 1</a>
    </body>
    </html>'
  end

  subject { Webpage.new.fetch(valid_url) }

  context 'calls fetch with a valid URL' do
    before do
      allow_any_instance_of(Webpage)
        .to receive(:get_html)
        .with(valid_url)
        .and_return(html_body)
    end

    it 'does not raise Invalid URL error' do
      expect { subject }.to_not raise_error
    end

    it 'returns an object with assets and links attributes' do
      expect(subject).to be_a(Hash)
      expect(subject).to have_key(:assets)
      expect(subject).to have_key(:links)
    end

    it 'returns an object with assets and links attributes that are arrays' do
      expect(subject[:assets]).to be_a(Array)
      expect(subject[:links]).to be_a(Array)
    end

    it 'returns an object with assets attribute containing 5 elements' do
      expect(subject[:assets].count).to eq(5)
    end

    it 'returns an object with links attribute containing 4 elements' do
      expect(subject[:links].count).to eq(4)
    end

    it 'contains the correct img srcs' do
      expect(subject[:assets]).to include('img1.jpg')
    end

    it 'contains the correct anchor hrefs' do
      expect(subject[:links]).to include('https://www.example1.com')
    end
  end

  context 'calls fetch with invalid URL' do
    it 'raises Invalid URL error' do
      expect { Webpage.new.fetch(invalid_url) }.to raise_error(RuntimeError)
    end
  end
end
