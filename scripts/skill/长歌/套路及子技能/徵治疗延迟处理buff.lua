---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/���˺��ӳٴ���buff.lua
-- ����ʱ��:	2015/8/6 15:28:22
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/�����˺�����ɢ���Ĭ.lua
-- ����ʱ��:	2015/8/5 23:00:36
-- �����û�:	mengxiangfei11
-- �ű�˵��:
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)

	local player = GetPlayer(nCharacterID)
	if player then
		if BuffID == 9448 then
			player.AddBuff(player.dwID, player.nLevel, 9443, 1)
			player.AddBuff(player.dwID, player.nLevel, 9444, 1)
		elseif BuffID == 9449 then
			player.AddBuff(player.dwID, player.nLevel, 9445, 1)
		elseif BuffID == 9450 then
			player.AddBuff(player.dwID, player.nLevel, 9446, 1)
			player.DelBuff(9444, 1)
		elseif BuffID == 9451 then
			player.AddBuff(player.dwID, player.nLevel, 9447, 1)
			player.DelBuff(9445, 1)
		elseif BuffID == 9452 then
			player.AddBuff(player.dwID, player.nLevel, 9500, 1)
			player.DelBuff(9446, 1)
		else
			player.DelBuff(9443, 1)
			player.DelBuff(9447, 1)
			player.DelBuff(9500, 1)
		end
	end
end;

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com