import type { BooleanLike } from 'common/react';
import { useBackend } from 'tgui/backend';
import { Button, Collapsible, Divider, Flex, Section } from 'tgui/components';
import { Window } from 'tgui/layouts';

interface Data {
  status?: string;
  details?: string;
  busy?: BooleanLike;
}

// Reusable helper for consistent tall buttons
const TallButton = (props) => (
  <Button
    {...props}
    fluid
    style={{
      height: '64px',
      fontSize: '18px',
      lineHeight: '64px',
      textAlign: 'center',
    }}
  />
);

export const PartFabricatorVehicle = (props, context) => {
  const { act, data } = useBackend<Data>();

  return (
    <Window width={900} height={600}>
      <Window.Content>
        <Flex direction="row" grow={1}>
          {/* Left Column (slimmer) */}
          <Flex.Item basis="34%" grow={0} mr={1}>
            <Section title="Vehicles">
              <Flex direction="column" gap={1}>
                <TallButton onClick={() => act('vehicle1')}>Jeep</TallButton>
                <TallButton onClick={() => act('vehicle2')}>ARC</TallButton>
                <TallButton onClick={() => act('vehicle3')}>APC</TallButton>
                <TallButton onClick={() => act('vehicle4')}>LAV</TallButton>
                <TallButton onClick={() => act('vehicle5')}>
                  Longstreet
                </TallButton>
              </Flex>
            </Section>
          </Flex.Item>

          {/* Vertical divider using built-in component */}
          <Divider vertical />

          {/* Right Column (wider) */}
          <Flex.Item basis="66%" grow={1} ml={1}>
            <Flex direction="column" gap={1}>
              <Collapsible title="Primary Weapons" open>
                <Flex direction="column" gap={1}>
                  <div>
                    <strong>Info:</strong>{' '}
                    {data.details ?? 'No details available'}
                  </div>
                  <TallButton onClick={() => act('expand')}>Expand</TallButton>
                </Flex>
              </Collapsible>

              <Collapsible title="Primary Ammunition">
                <Flex direction="column" gap={1}>
                  <div>
                    <strong>Status:</strong>{' '}
                    {data.status ?? 'No status available'}
                  </div>
                  <TallButton onClick={() => act('refresh_status')}>
                    Refresh
                  </TallButton>
                </Flex>
              </Collapsible>

              <Collapsible title="Secondary Weapons">
                <Flex direction="column" gap={1}>
                  <div>
                    <strong>Status:</strong>{' '}
                    {data.status ?? 'No status available'}
                  </div>
                  <TallButton onClick={() => act('refresh_status')}>
                    Refresh
                  </TallButton>
                </Flex>
              </Collapsible>

              <Collapsible title="Secondary Ammunition">
                <Flex direction="column" gap={1}>
                  <div>
                    <strong>Status:</strong>{' '}
                    {data.status ?? 'No status available'}
                  </div>
                  <TallButton onClick={() => act('refresh_status')}>
                    Refresh
                  </TallButton>
                </Flex>
              </Collapsible>

              <Collapsible title="Support Modules">
                <Flex direction="column" gap={1}>
                  <TallButton onClick={() => act('build')}>Build</TallButton>
                </Flex>
              </Collapsible>
            </Flex>
          </Flex.Item>
        </Flex>
      </Window.Content>
    </Window>
  );
};
