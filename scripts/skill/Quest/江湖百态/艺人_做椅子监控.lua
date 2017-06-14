---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/����_�����Ӽ��.lua
-- ����ʱ��:	2016/7/13 17:38:26
-- �����û�:	wangwei2
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local buff = player.GetBuff(10978, 1)
	if not buff then
		player.DoAction(0, 0)
		return
	end
	local chair = GetNpc(buff.nCustomValue)
	if not chair then
		player.DoAction(0, 0)
		player.DelBuff(10978, 1)
		return
	end
	if GetDistanceSq(chair.nX, chair.nY, chair.nZ, player.nX, player.nY, player.nZ) <= (0.6 * 64) ^ 2 and math.abs(player.nFaceDirection - chair.nFaceDirection) <= 5 then
		player.DoAction(0, 20164)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com