---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/׽Ӱʽ����.lua
-- ����ʱ��:	2016/6/17 17:27:32
-- �����û�:	XIAXIANBO
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	--if player.GetSkillLevel(6578) == 1 then
	target.AddBuff(dwSkillSrcID, player.nLevel, 6191, 1, 1)
	--end

	--��ѨԵ��˫׽Ӱ
--[[
	if player.GetSkillLevel(5911) == 1 then
		if not player.GetBuff(8417, 1) and not player.GetBuff(8747, 1) then
			player.AddBuff(player.dwID, player.nLevel, 8416, 1, 1)
			player.AddBuff(player.dwID, player.nLevel, 8747, 1, 1)
		else
			--print(44444)
			player.DelBuff(8417, 1)
			player.DelBuff(8747, 1)
		end
	end
	--print(111111)
	if player.GetBuff(8417, 1) then
		player.DelBuff(8417, 1)
	end
--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com