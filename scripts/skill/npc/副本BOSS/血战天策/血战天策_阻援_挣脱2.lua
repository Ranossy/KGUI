------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-9-10
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	local dongnanshuaguaikongzhi = scene.GetNpcByNickName("dongnanshuaiguaikongzhi")
	player.DelBuff(6676, 1)
	
	if dongnanshuaguaikongzhi then
		local nindex = dongnanshuaguaikongzhi.GetCustomInteger4(4)
		for i = 1, nindex + 1 do
			local xiaoguai = scene.GetNpcByNickName("dongnanlangyabing" .. i)
			if xiaoguai then
				if xiaoguai.GetCustomInteger4(20) == player.dwID then
					xiaoguai.DelBuff(6675, 1)
					xiaoguai.SetCustomInteger4(20, 0)
				end
				
				if xiaoguai.GetCustomInteger4(24) == player.dwID then
					xiaoguai.DelBuff(6675, 1)
					xiaoguai.SetCustomInteger4(24, 0)
				end
				
				if xiaoguai.GetCustomInteger4(28) == player.dwID then
					xiaoguai.DelBuff(6675, 1)
					xiaoguai.SetCustomInteger4(28, 0)
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com