---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�����﷨_����.lua
-- ����ʱ��:	2013/5/10 11:34:41
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_�����﷨_����.lua
-- ������    :  �ź�	
-- ����ʱ��  :  2011-04-11
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  �����﷨
-- ��������  :  ����
-- ����Ч��  :  ������������Ŀ��ʩ��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamage = 230 * 0.95, nDamageRand = 230 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
};



--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_�����﷨_����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
	--tSkillData[dwSkillLevel].nDamage,
	--0
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
	--tSkillData[dwSkillLevel].nDamageRand,
	--0
	--);
	    
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
	--0,
	--0
	--);

	--skill.BindBuff(1, 3465, 1)  --�����
	
	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 436);
	skill.SetCheckCoolDown(1, 444)
	--skill.SetCheckCoolDown(2, 436)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 80;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   skill.nCostManaBasePercent = 80
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nWeaponDamagePercent = 0;
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 25 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	--skill.nPrepareFrames    = 8;										--����֡��,16֡����1��
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
	skill.nChannelInterval = 64; 									-- ͨ�������ʱ�� 
	--skill.nBreakRate	= 1024;									--���ʩ������
  
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if nPreResult ~= SKILL_RESULT_CODE.SUCCESS then
		return nPreResult 
	end
	local target = player.GetSelectCharacter()
	if target == nil then
		return false
	end
	local nTargetDirection = GetLogicDirection(target.nX - player.nX, target.nY - player.nY);
	local nPlayerDirection = player.nFaceDirection
	local nDirectionA = math.mod(nTargetDirection + 64 + 256, 256)
	local nDirectionB = math.mod(nTargetDirection-64 + 256, 256)

	if nPlayerDirection > nDirectionA or nPlayerDirection < nDirectionB then
		player.TurnTo(math.mod(nTargetDirection + 128, 256))
		return nPreResult;
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.AddBuff(dwCharacterID, player.nLevel, 5873, 1, 1)
	local target = player.GetSelectCharacter()
	if target == nil then
		return false
	end
	local nTargetDirection = GetLogicDirection(target.nX - player.nX, target.nY - player.nY);
	local nPlayerDirection = player.nFaceDirection
	local nDirectionA = math.mod(nTargetDirection + 64 + 256, 256)
	local nDirectionB = math.mod(nTargetDirection-64 + 256, 256)

	if nPlayerDirection > nDirectionA or nPlayerDirection < nDirectionB then
		--player.TurnTo(math.mod(nTargetDirection + 128, 256))
		player.CastSkill(6232, 1)
	else
		player.CastSkill(6231, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com