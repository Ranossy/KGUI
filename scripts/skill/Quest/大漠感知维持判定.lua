---------------------------------------------------------------------->
-- �ű�����:	F:/zhugan/client/scripts/skill/Quest/��Į��֪ά���ж�.lua
-- ����ʱ��:	2012/11/27 19:39:32
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	local tbuff1 = target.GetBuff(4052, 1)
	local tbuff2 = target.GetBuff(4052, 2)
	local tbuff3 = target.GetBuff(4052, 3)
	local tbuff4 = target.GetBuff(4052, 4)
	if (not tbuff1) and (not tbuff2) and (not tbuff3) and (not tbuff4)  then
		target.DelBuff(4496, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com