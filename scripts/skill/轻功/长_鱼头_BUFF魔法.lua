---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ṧ/��_��ͷ_BUFFħ��.lua
-- ����ʱ��:	2015/10/7 9:32:40
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��ͷʵ�ⱸע��һ��BUFF��ħ���ű��е�Apply ����������Ӵ�BUFFʱ�򴥷�һ��
-- ��ͷʵ�ⱸע��һ��BUFF��ħ���ű��е�UnApply �������ڴ�BUFF��ʧʱ�򴥷�һ�θ����������ᴥ����ά��������������ʧ��player.DelBuff(8475,1)��ʧ��ʱ�䵽����ʧ��
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then

		if player.dwForceID == 22 then --����
			player.SetPassiveVelocityXY(200)
			player.SetPassiveVelocityZ(-60)
		elseif player.dwForceID == 2 then --��
			player.SetPassiveVelocityXY(500)
			player.SetPassiveVelocityZ(-90)
		elseif player.dwForceID == 5 then --����
			player.SetPassiveVelocityXY(700)
			player.SetPassiveVelocityZ(-80)
		elseif player.dwForceID == 7 then --����
			if player.nJumpCount <= 7 then--�ӵ��߶�֮ǰ����
				player.SetPassiveVelocityXY(1000)
				player.SetPassiveVelocityZ(-100)
			elseif player.nJumpCount == 8 then--�ӵڰ˶ν���
				player.SetPassiveVelocityXY(1200)
				player.SetPassiveVelocityZ(-200)
			else
				player.SetPassiveVelocityXY(800)
				player.SetPassiveVelocityZ(-60)
			end
		elseif player.dwForceID == 6 then --�嶾
			player.SetPassiveVelocityXY(600)
			player.SetPassiveVelocityZ(-60)
		else--ͨ������
			player.SetPassiveVelocityXY(800)
			player.SetPassiveVelocityZ(-60)
		end
		
		player.LockPassiveDirectionXYByFace()
	end
end
--
-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetPassiveVelocityXY(0)
		player.SetPassiveVelocityZ(0)
		player.UnlockPassiveDirectionXYByFace()
		player.SetHangVelocity(0, 0)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com