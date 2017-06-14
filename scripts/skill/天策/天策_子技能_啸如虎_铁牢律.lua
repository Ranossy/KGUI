------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_Х�绢_������.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-03-5
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  Х�绢
-- ��������  :  ��ˮһս
-- ����Ч��  :  ����30%����ʹ��,�������⹦������,�⹦����ֵ,�⹦������,ͬʱ��ʱ�䲻������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostMana = 0, nBuffID = 10225, nBuffLevel = 1},		-- Level 1
	{nCostMana = 0, nBuffID = 10225, nBuffLevel = 2},		-- Level 2
	{nCostMana = 0, nBuffID = 10225, nBuffLevel = 3},		-- Level 3
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_BUFF,
		tSkillData[dwSkillLevel].nBuffID,
		tSkillData[dwSkillLevel].nBuffLevel
	);
   --08��8��29�� �ü��ܲ��ٻظ�����. ע�����´���.
--    skill.AddAttribute(
--    	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.SKILL_THERAPY,
--		tSkillData[dwSkillLevel].nTherapy,
--		0
--    )
--    
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
--		ATTRIBUTE_TYPE.CALL_THERAPY,
--		0,
--		0
--	);
		

    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--����CD1��
	--skill.SetNormalCoolDown(2, 100);
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 256; 										--ʩ�ŽǶ�,ȫ��256
    
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
    return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local dwPlayerLife = player.nCurrentLife;
	local dwPlayerMaxLife = player.nMaxLife;
    
	if dwPlayerLife  <  dwPlayerMaxLife*0.3 then
	else
		return false;
	end
    
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--������ħ������Ӧ��ʱ��ִ�нű�,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
 
end

--������ħ�����Է�Ӧ��ʱ��ִ�нű�,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)

end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com