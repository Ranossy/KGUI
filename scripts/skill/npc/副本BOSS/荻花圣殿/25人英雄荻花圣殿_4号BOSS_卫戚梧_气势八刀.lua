------------------------------------------------
-- �ļ���    : ݶ��ʥ��_4��BOSS_������_���ư˵�.lua
-- ������    :  zhanghao
-- ����ʱ��  :  2010-11-8
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  ��ȫ����������BUFF
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local Buff_ID = 2188
		local Buff_LV = 4
		local cPlayer = GetPlayer(dwCharacterID)
		if cPlayer then
			local scene = cPlayer.GetScene()
			local nPlayer = {}
			local tPlayer = scene.GetAllPlayer()
			if tPlayer then
				for i = 1, #tPlayer do
					local cPlayer = GetPlayer(tPlayer[i])
					if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
						cPlayer.AddBuff(0, 99, Buff_ID, Buff_LV)
					end
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com