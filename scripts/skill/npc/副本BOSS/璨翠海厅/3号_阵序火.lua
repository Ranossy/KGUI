---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/貴亣��/3��_�����.lua
-- ����ʱ��:	2015/5/30 16:24:21
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local buff = player.GetBuff(8904, 1)
	if buff then
		player.DelBuff(8904, 1)
	end
	
	local buff1 = player.GetBuff(8904, 2)
	if buff1 then
		player.DelBuff(8904, 2)
	end
end

function UnApply(dwCharacterID)
	--print(44444)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com