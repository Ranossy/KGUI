------------------------------------------------
-- �ļ���    : ݶ��ʥ��_3��BOSS_��ҩ����_�Ų���ˮ_ʩ��.lua
-- ������    :  zhanghao
-- ����ʱ��  :  2011-01-23
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  ��BOSS���Լ���BUFF
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
			local npc = GetNpc(dwCharacterID)
	if npc then 
		local scene = npc.GetScene()
				if scene then
					npc1 = scene.GetNpcByNickName("MuRongZhuiFeng")
					if npc1 then
						npc.CastSkill(2117,2,TARGET.NPC,npc1.dwID) 
					end
				end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com