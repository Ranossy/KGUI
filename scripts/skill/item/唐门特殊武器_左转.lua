---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/������������_��ת.lua
-- ����ʱ��:	2016/1/27 16:15:02
-- �����û�:	zhangchennan
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	if target.GetBuff(4166, 1) then
	target.DelBuff(4166, 1)
	target.TurnTo(target.nFaceDirection + 64)
		target.AddBuff(0, 99, 4166, 1)
	end
		if target.GetBuff(10478, 1) then
	target.DelBuff(10478, 1)
	target.TurnTo(target.nFaceDirection + 64)
		target.AddBuff(0, 99, 10478, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com