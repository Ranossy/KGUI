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
		if BuffID == 9390 then
			player.AddBuff(player.dwID, player.nLevel, 9381, 1)
			player.AddBuff(player.dwID, player.nLevel, 9382, 1)
		elseif BuffID == 9391 then
			player.AddBuff(player.dwID, player.nLevel, 9383, 1)
		elseif BuffID == 9392 then
			player.AddBuff(player.dwID, player.nLevel, 9384, 1)
			player.DelBuff(9382, 1)
		elseif BuffID == 9393 then
			player.AddBuff(player.dwID, player.nLevel, 9385, 1)
			player.DelBuff(9383, 1)
		elseif BuffID == 9394 then
			player.AddBuff(player.dwID, player.nLevel, 9498, 1)
			player.DelBuff(9384, 1)
		else
			player.DelBuff(9381, 1)
			player.DelBuff(9385, 1)
			player.DelBuff(9498, 1)
		end
	end
end;

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com