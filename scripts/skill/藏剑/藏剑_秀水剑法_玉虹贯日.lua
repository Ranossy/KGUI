------------------------------------------------
-- �ļ���    :  �ؽ�_��ˮ����_������.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-27
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��ˮ����
-- ��������  :  ������
-- ����Ч��  :  ����ţ�������������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 20, nCostRage = 0 , nDashSpeed = 100},   	-- Level 1 Dash�ٶȵ�λ ��/֡
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH,
		tSkillData[dwSkillLevel].nDashSpeed,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_RAGE,
		tSkillData[dwSkillLevel].nAddRage,
		0
	);

	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	ATTRIBUTE_TYPE.CALL_BUFF,
	1687,
	1
	);--��ӻ�����������Buff

 	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1736,
		1
	);
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 332);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius	= 5* LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius        = 24 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end

function Apply(dwCharacterID)
	--print("1111")
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	local target = player.GetSelectCharacter()
	if not target then 
		return
	end
	player.TurnToCharacter(target.dwID)
	target.TurnToCharacter(player.dwID)
	player.AdjustPlayerDistance(target.dwID,128)
	return nPreResult;
end
--function UnApply(dwCharacterID)
--end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com