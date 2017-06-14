------------------------------------------------
-- �ļ���    :  ��������_buff������.lua
-- ������    :  CBG
-- ����ʱ��  :  2010-12-1
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��ʽ
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nDamageBase = 69, 	nDamageRand = 07,  	nCostMana = 73}, 	--level 1
    { nDamageBase = 93, 	nDamageRand = 09,  	nCostMana = 109},	--level 2
    { nDamageBase = 119, 	nDamageRand = 12,  	nCostMana = 162},	--level 3
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
        "skill/��/��������_buff������.lua", 			
        0
    );
    
	--skill.BindBuff(1, 687, 1)	
	
    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 25 * LENGTH_BASE;						--����ʩ�����뾶
    skill.nAngleRange       = 256; 		

    return true;
end
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end

	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	
	if target then
		local MaxMP = target.nMaxMana
		local CurrentMP = target.nCurrentMana
		local nAP = player.nNeutralAttackPower
		local cof = math.floor(nAP/5,1)
		if CurrentMP > (2000+cof) * (1 - target.nDecriticalDamagePower * 0.000175) then
			target.nCurrentMana = CurrentMP - (2000 + cof) * (1 - target.nDecriticalDamagePower * 0.000175)
		else
			target.nCurrentMana = 0
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com