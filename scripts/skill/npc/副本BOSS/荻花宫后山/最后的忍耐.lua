---------------------------------------------------------------------->
-- �ű�����:	scripts/Map/ݶ������ɽ/skill/��������.lua
-- ����ʱ��:	12/01/10 16:41:58
-- �����û�:	yule-PC
-- �ű�˵��:	
----------------------------------------------------------------------<


-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID) 
	local Buff_ID = 2319
	local Buff_LV = 1
	local cNpc = GetNpc(dwCharacterID)
	if cNpc then
		local scene = cNpc.GetScene()
		if not scene then
			return
		end
		local tPlayer = scene.GetAllPlayer()
		if tPlayer then
			for i = 1, #tPlayer do
				local thisPlayer = GetPlayer(tPlayer[i])
				if thisPlayer and thisPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
					thisPlayer.AddBuff(0, 99, Buff_ID, Buff_LV)
				end
			end
		end
	end
end

-- ���ܷ�Ӧ�ýű�, ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com