------------------------------------------------
-- �ļ���    : �����Ṧ_���˹�_���Ϸ�.lua
-- ������    :  ����	--�޸�By ֩��
-- ����ʱ��  :  2009-07-14  --2009-12-18�޸�
-- ��;(ģ��):  �书����
-- �书����  :  
-- �书����  :  
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ���¹⣬Ϊ�����յ��ã���Ը�ڹ�԰��ز��������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nCostMana = 31, nBuffID = 1299},		-- Level 1
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;

	for i = 1,11 do
			skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			208,
			i
			);				--��������ݵ�Buff
	end		
	
	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			1063,
			1
			); 				--��������ݵĿ�ˤBuff
	
	for i = 1,2 do
			skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			1089,
			i
			);        --�����ҡֱ�ϵĿ�ˤBuff
	end
	
	
	for i = 1,6 do
			skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			139,
			i
			);				--�����ҡֱ�ϵ�Buff
	end

			skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			3217,
			1
			);				--�������������BUFF
	----------------- BUFF��� -------------------------------------------------
	skill.BindBuff(1, 1299,1)
	skill.BindBuff(2, 1260,1) --�������л�ģ����������Buff

    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
		skill.SetPublicCoolDown(16);		--����CD1��
    skill.SetNormalCoolDown(2, 88);    
    skill.SetNormalCoolDown(3, 248);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0											--����ʩ����С�뾶
    --skill.nMaxRadius        = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
    --skill.nAngleRange       = 256; 										--ʩ�ŽǶ�,ȫ��256
    
    
    --skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    --skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com