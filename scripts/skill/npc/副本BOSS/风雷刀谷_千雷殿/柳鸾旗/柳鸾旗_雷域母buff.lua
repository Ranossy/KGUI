---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_ǧ�׵�/�����/�����_����ĸbuff.lua
-- ����ʱ��:	2017/2/15 16:49:39
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		local npc = scene.GetNpcByNickName("liuluanqiboss")
		if scene.dwMapID == 264 or scene.dwMapID == 272 then
			if not npc then
				player.DelGroupBuff(11703, 1)
				player.DelBuff(11702, 1)
			end

			if npc and npc.bFightState == false then
				player.DelGroupBuff(11703, 1)
				player.DelBuff(11702, 1)
			end
		
			if npc then
				player.AddBuff(npc.dwID, npc.nLevel, 11703, 1, 300)
			end
		end

		if scene.dwMapID == 270 then
			if not npc then
				player.DelGroupBuff(11703, 2)
				player.DelBuff(11702, 2)
			end

			if npc and npc.bFightState == false then
				player.DelGroupBuff(11703, 2)
				player.DelBuff(11702, 2)
			end
		
			if npc then
				if npc.GetBuff(3819, 1) then
					for i = 1, 2 do
						player.AddBuff(npc.dwID, npc.nLevel, 11703, 2, 300)
					end
				else
					player.AddBuff(npc.dwID, npc.nLevel, 11703, 2, 300)
				end
				if player.GetBuff(11703, 2) then
					if player.GetBuff(11703, 2).nStackNum >= 16 then
						player.Die()
					end
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com