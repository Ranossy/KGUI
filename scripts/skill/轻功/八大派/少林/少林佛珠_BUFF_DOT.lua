---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ṧ/�˴���/����/���ַ���_BUFF_DOT.lua
-- ����ʱ��:	2016/4/16 13:46:47
-- �����û�:	zhangyan-pc
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--print(11111)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.nMoveState == MOVE_STATE.ON_SWIM then
		--�˳��Ϳ�
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end

	if player.nMoveState == MOVE_STATE.ON_STAND then
		--�˳��Ϳ�
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end

	if player.nMoveState == MOVE_STATE.ON_DEATH then
		--�˳��Ϳ�
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end

	if player.bOnHorse then
		--�˳��Ϳ�
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end

	local nH, nType = player.GetAltitude()
	--print(nH .. "__" ..nType)
	--if nH < 2000 and nType == 1 then
	--player.DelBuff(9891, 1)
	--end
	--]]

end

function UnApply(dwCharacterID)

end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com