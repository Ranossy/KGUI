---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��¹��ԭ/�ݳǳ�_����.lua
-- ����ʱ��:	2014/7/9 15:08:47
-- �����û�:	lilin-kingsoft
-- �ű�˵��:
----------------------------------------------------------------------<

function Apply(dwCharacter)
	local target
	if IsPlayer(dwCharacter) then
		target = GetPlayer(dwCharacter)
	else
		target = GetNpc(dwCharacter)
	end
	
	if not target then
		return
	end
	
	local nCostLife = math.min(target.nMaxLife * 0.05, 10000)
	if target.nCurrentLife <= nCostLife then
		target.Die()
		return
	end
	
	target.nCurrentLife = target.nCurrentLife - nCostLife
end

function UnApply(dwCharacter)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com