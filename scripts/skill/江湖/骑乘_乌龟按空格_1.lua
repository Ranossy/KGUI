---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���_�ڹ갴�ո�_1.lua
-- ����ʱ��:	2014/12/16 23:39:43
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/���_�ڹ갴�ո�_1.lua",
		0														
	);
    
	-- skill.nCostMana			= 0;
	skill.SetCheckCoolDown(1, 444)
	--------------- ����������� ----------------------------------------------------------------------
   
	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0;										--����ʩ����С�뾶
	skill.nMaxRadius = 25 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�
	skill.nAreaRadius = 25 * LENGTH_BASE;
	--skill.nPrepareFrames = 48;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
	return true;
end

function CanCast(player, nPreResult)    
	local item = player.GetEquippedHorse()
	if not item then		
		return false;
	end
	return nPreResult;		
end

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then 
		return
	end
	local nItem = cPlayer.GetEquippedHorse()
	if not nItem then
		return
	end
	
	if nItem.dwIndex == 13148 then--�ڹ�
		local buff1 = cPlayer.GetBuff(8706, 1)
		if not buff1 then
			cPlayer.AddBuff(0, 99, 8706, 1, 5)--����
			local buff = cPlayer.GetBuff(244, 6)
			if buff then
				buff.nCustomValue = 1
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com