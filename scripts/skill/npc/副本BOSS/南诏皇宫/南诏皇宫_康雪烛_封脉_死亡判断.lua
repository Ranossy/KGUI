------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2012-9-19
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
		local scene = cPlayer.GetScene()
		if not scene then
			return
		end
		local cNpc = scene.GetNpcByNickName("KangXueZhu")
		if not cNpc then
			return
		end
		if cNpc.GetCustomBoolean(16)  then
			cNpc.SetCustomBoolean(16, false)
		end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	if cPlayer.nMoveState == MOVE_STATE.ON_DEATH then
		local scene = cPlayer.GetScene()
		if not scene then
			return
		end
		local cNpc = scene.GetNpcByNickName("KangXueZhu")
		if not cNpc then
			return
		end
		if not cNpc.GetCustomBoolean(16) then 
			cNpc.AddBuff(0, 99, 4526, 1, 9999)
			cNpc.SetCustomBoolean(16, true)
			local zongkong = scene.GetNpcByNickName("NZWzongkong")
			if not zongkong then
				return
			end
			zongkong.SetCustomBoolean(29, true)
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com