---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս_������/ʷ˼��_ä��Ѫ��_���׷��.lua
-- ����ʱ��:	2014/10/10 16:27:59
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)

end

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end

	local npc = GetNpc(nCustomValue)
	if not npc then
		return
	end
	---[[NPC������˲������ǣ���ʱɾ��BUFF�����˺���
	if npc.GetCustomInteger1(10) ~= 0 then
		--print("ɾ��׷�ٱ��2")
		return
	end
	--]]
	--print("111111")
	if nLeftFrame ~= 0 then
		if player.bFightState == false then
			return
		end
		--print("222222")
		--------------���NPC����û�п�ŭЧ��������2001�¼�����������״̬---
	
		local level = 1		
		local scene = player.GetScene()
		if scene.dwMapID == 199 then
			level = 2
		elseif scene.dwMapID == 206 then
			level = 3
		elseif scene.dwMapID == 212 then
			level = 4
		end
		--print("333333")
		local buff_kb = npc.GetBuff(8225, 1)         --��BUFF
		local buff_kh = npc.GetBuff(8226, 1)         --����BUFF
		if not buff_kb and not buff_kh then          --����BUFF��û��ʱ�������¼���
			npc.FireAIEvent(2001, 0, 0)
		end
		--print("44444")
		npc.CastSkill(13035, level, TARGET.PLAYER, player.dwID)
		npc.DelBuff(8707, 1)
--print("5555")
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com