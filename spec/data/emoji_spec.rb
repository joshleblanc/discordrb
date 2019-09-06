# frozen_string_literal: true

require 'discordrb'

describe Discordrb::Emoji do
  let(:bot) { double('bot') }

  subject(:emoji) do
    server = double('server', role: double)

    described_class.new(emoji_data, bot, server)
  end

  fixture :emoji_data, %i[emoji]

  describe '#mention' do
    context 'with an animated emoji' do
      it 'serializes with animated flag' do
        allow(emoji).to receive(:animated).and_return(true)

        expect(emoji.mention).to eq '<a:rubytaco:315242245274075157>'
      end
    end

    it 'serializes' do
      expect(emoji.mention).to eq '<:rubytaco:315242245274075157>'
    end
  end
end
