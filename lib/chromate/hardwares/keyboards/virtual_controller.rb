# frozen_string_literal: true

module Chromate
  module Hardwares
    module Keyboards
      class VirtualController < Chromate::Hardwares::KeyboardController
        def press_key(key = 'Enter')
          params = {
            key: key,
            code: key_to_code(key),
            windowsVirtualKeyCode: key_to_virtual_code(key)
          }

          params[:text] = key if key.length == 1

          # Dispatch keyDown event
          client.send_message('Input.dispatchKeyEvent', params.merge(type: 'keyDown'))

          # Dispatch keyUp event
          client.send_message('Input.dispatchKeyEvent', params.merge(type: 'keyUp'))

          self
        end

        private

        # @param [String] key
        # @return [String]
        def key_to_code(key)
          case key
          when 'Enter' then 'Enter'
          when 'Tab' then 'Tab'
          when 'Backspace' then 'Backspace'
          when 'Delete' then 'Delete'
          when 'Escape' then 'Escape'
          when 'ArrowLeft' then 'ArrowLeft'
          when 'ArrowRight' then 'ArrowRight'
          when 'ArrowUp' then 'ArrowUp'
          when 'ArrowDown' then 'ArrowDown'
          when '.' then 'Period'
          when ',' then 'Comma'
          when '/' then 'Slash'
          when ';' then 'Semicolon'
          when "'" then 'Quote'
          when '[' then 'BracketLeft'
          when ']' then 'BracketRight'
          when '\\' then 'Backslash'
          when '-' then 'Minus'
          when '=' then 'Equal'
          when '`' then 'Backquote'
          when ' ' then 'Space'
          when 'Shift' then 'ShiftLeft'
          when 'Control' then 'ControlLeft'
          when 'Alt' then 'AltLeft'
          when 'Meta' then 'MetaLeft'
          when 'Home' then 'Home'
          when 'End' then 'End'
          when 'PageUp' then 'PageUp'
          when 'PageDown' then 'PageDown'
          when 'Insert' then 'Insert'
          when 'CapsLock' then 'CapsLock'
          when 'NumLock' then 'NumLock'
          when 'ScrollLock' then 'ScrollLock'
          else
            "Key#{key.upcase}"
          end
        end

        # @param [String] key
        # @return [Integer]
        def key_to_virtual_code(key)
          case key
          when 'Enter' then 0x0D  # 13
          when 'Tab' then 0x09    # 9
          when 'Backspace' then 0x08  # 8
          when 'Delete' then 0x2E  # 46
          when 'Escape' then 0x1B  # 27
          when 'ArrowLeft' then 0x25  # 37
          when 'ArrowRight' then 0x27  # 39
          when 'ArrowUp' then 0x26  # 38
          when 'ArrowDown' then 0x28  # 40
          when '.' then 0xBE  # 190
          when ',' then 0xBC  # 188
          when '/' then 0xBF  # 191
          when ';' then 0xBA  # 186
          when "'" then 0xDE  # 222
          when '[' then 0xDB  # 219
          when ']' then 0xDD  # 221
          when '\\' then 0xDC  # 220
          when '-' then 0xBD  # 189
          when '=' then 0xBB  # 187
          when '`' then 0xC0  # 192
          when ' ' then 0x20  # 32
          when 'Shift' then 0x10  # 16
          when 'Control' then 0x11  # 17
          when 'Alt' then 0x12  # 18
          when 'Meta' then 0x5B  # 91
          when 'Home' then 0x24  # 36
          when 'End' then 0x23  # 35
          when 'PageUp' then 0x21  # 33
          when 'PageDown' then 0x22  # 34
          when 'Insert' then 0x2D  # 45
          when 'CapsLock' then 0x14  # 20
          when 'NumLock' then 0x90  # 144
          when 'ScrollLock' then 0x91  # 145
          else
            key.upcase.ord
          end
        end
      end
    end
  end
end
